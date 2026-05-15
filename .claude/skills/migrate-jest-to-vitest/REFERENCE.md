# migrate-jest-to-vitest — Reference

## 1. pnpm-workspace.yaml — add vitest catalog

```yaml
  vitest:
    "vitest": "^3.0.0"
    "@vitest/coverage-v8": "^3.0.0"
```

## 2. package.json changes

### Scripts
| Old | New |
|-----|-----|
| `LOG_LEVEL=error jest --logHeapUsage` | `vitest run` |
| `jest --coverage --logHeapUsage --forceExit` | `vitest run --coverage` |
| `NODE_OPTIONS='...' jest --logHeapUsage --forceExit --coverage` | `vitest run --coverage` |
| `jest --watch` | `vitest` |
| `node --inspect-brk ... jest --runInBand` | `vitest --inspect-brk --logHeapUsage --pool=forks` |

Keep contract test script unchanged: `jest --config ./test/jest-contract.json`

### devDependencies — add
```json
"@sl/vitest-config": "workspace:*",
"@vitest/coverage-v8": "catalog:vitest",
"vitest": "catalog:vitest"
```

Remove `unplugin-swc`, `@swc/cli`, `@swc/jest` — no longer needed for test runs. Keep `@swc/core` only if used by build tooling.

## 3. vitest.config.ts

Use the shared `@sl/vitest-config` package (in `tools/vitest-config/`). All coverage settings, reporters, thresholds, and NestJS-specific excludes are baked in.

```typescript
import { nestConfig } from '@sl/vitest-config'

export default nestConfig
```

If the package needs overrides (e.g. extra coverage excludes, custom reporters), use `mergeConfig`:

```typescript
import { nestConfig } from '@sl/vitest-config'
import { defineConfig, mergeConfig } from 'vitest/config'

export default mergeConfig(
  nestConfig,
  defineConfig({
    test: {
      // package-specific overrides only
    },
  }),
)
```

`@sl/vitest-config` must be built before tests run. NX handles this automatically via `"test": { "dependsOn": ["^build"] }` in `nx.json`.

## 4. tsconfig.spec.json

```json
{
  "extends": "./tsconfig.json",
  "compilerOptions": {
    "types": ["vitest/globals", "node"],
    "noEmit": true
  },
  "include": ["src", "**/*.spec.ts", "test"]
}
```

> **Note**: The base `@sl/tsconfig` already sets `emitDecoratorMetadata: true`, so NestJS DI works without `unplugin-swc`.

## 5. Spec file replacements — TWO PASSES REQUIRED

**Pass 1** — sed (same-line patterns):
```bash
sed -i '' \
  's/jest\.fn/vi.fn/g' \
  's/jest\.Mock/ReturnType<typeof vi.fn>/g' \
  's/jest\.clearAllMocks/vi.clearAllMocks/g' \
  's/jest\.spyOn/vi.spyOn/g' \
  path/to/*.spec.ts
```

**Pass 2** — Python (multi-line pattern where `jest` and `.fn()` are on separate lines):
```bash
python3 -c "
import re, sys
for path in sys.argv[1:]:
    content = open(path).read()
    fixed = re.sub(r'\bjest\n\s+\.fn\(', 'vi.fn(', content)
    open(path, 'w').write(fixed)
" src/**/*.spec.ts
```

Both passes are needed — sed misses the split-line case.

## 6. Convert `done` callbacks

Vitest deprecates the Jest `done` callback pattern.

**Before:**
```typescript
it('name', done => {
  service.method().then(
    () => { done() },
    reason => { expect(reason).toEqual(...); done() },
  )
})
```

**After (rejection):**
```typescript
it('name', async () => {
  await expect(service.method()).rejects.toEqual(...)
})
```

**After (success):**
```typescript
it('name', async () => {
  await service.method()
})
```

## Gotchas

- **`@quark/jest-opentelemetry-helpers`** (or similarly named packages) — works fine with vitest. `expect.extend()` and `beforeEach/afterEach` globals are compatible.
- **Snapshots** — first run rewrites from Jest format to Vitest format and reports obsolete keys. Run `pnpm vitest run -u` to clean up.
- **Contract tests** (Pact) — keep on Jest via separate script; don't migrate these.
