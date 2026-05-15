- In all interactions and commit messages, be extremely concise and sacrifice grammar for the sake of concision.

## Model Selection

- Use Haiku subagents for exploration, file discovery, codebase research,
  and read-only tasks (no generation needed)
- Use Sonnet (default) for implementation, debugging, refactoring
- Use Opus for architecture decisions and complex cross-file reasoning

## GitHub

- Your primary method for interacting with GitHub should be the GitHub CLI.

## Plans

- At the end of each plan, give me a list of unresolved questions to answer, if any. Make the questions extremely concise. Sacrifice grammar for the sake of concision.
