---
name: migrate-jest-to-vitest
description: Migrate a NestJS TypeScript app in a pnpm monorepo from Jest to Vitest. Use when user asks to migrate, convert, or switch from Jest to Vitest in a NestJS app.
---

# Migrate Jest → Vitest (NestJS / pnpm)

## Checklist

- [ ] Read `jest.config.js`, `package.json`, `tsconfig.spec.json`, shared jest preset
- [ ] Confirm `vitest` catalog exists in `pnpm-workspace.yaml` (one-time per repo)
- [ ] Update `package.json` — scripts + devDeps (add `@sl/vitest-config`, remove `unplugin-swc`)
- [ ] Create `vitest.config.ts` — `import { nestConfig } from '@sl/vitest-config'`
- [ ] Update `tsconfig.spec.json` — include spec files, add `vitest/globals` type
- [ ] Delete `jest.config.js`
- [ ] Replace jest globals in all spec files (two passes — see REFERENCE.md)
- [ ] Convert `done` callbacks to async/await
- [ ] `pnpm install --filter <app-name>`
- [ ] Build `@sl/vitest-config` if not already built: `nx run @sl/vitest-config:build`
- [ ] `pnpm test` — fix any remaining failures
- [ ] `pnpm vitest run -u` — clean up obsolete snapshots

## Key files

See [REFERENCE.md](REFERENCE.md) for the full templates and gotchas.
