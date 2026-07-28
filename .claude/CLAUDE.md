- In all interactions and VCS messages, be extremely concise and sacrifice grammar for the sake of concision.

## Model Selection

- Use Haiku subagents for exploration, file discovery, codebase research,
  and read-only tasks (no generation needed)
- Use Sonnet (default) for implementation, debugging, refactoring
- Use Opus for architecture decisions and complex cross-file reasoning

## Version-control policy

Your primary VCS tool should be Jujutsu (jj) for all repositories.

When the current repository is a jj repository:

- Use `jj` for status, diffs, history, commits, rebases, bookmarks, undo, restore, fetch, and push.
- Do not use Git commands that mutate commits, refs, the index, or the working tree.
- In particular, do not run `git commit`, `git checkout`, `git switch`,
  `git reset`, `git rebase`, `git cherry-pick`, `git merge`, `git stash`,
  `git branch`, or `git restore`.
- Prefer jj terminology: change, revision, bookmark, working-copy commit.
- Do NOT perform operations that use remote (`jj git fetch`, `jj git push`)
- Read-only Git commands are acceptable only when an external tool requires
  them or jj lacks the necessary functionality.
- Before suggesting or executing an unfamiliar Git workflow, translate it into
  jj commands.

## GitHub

- Your primary method for interacting with GitHub should be the GitHub CLI.

## Plans

- At the end of each plan, give me a list of unresolved questions to answer, if any. Make the questions extremely concise. Sacrifice grammar for the sake of concision.
