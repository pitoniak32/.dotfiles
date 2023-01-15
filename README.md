# Bare Dotfiles Repo

[Original Post](https://www.atlassian.com/git/tutorials/dotfiles)

When using this method you should avoid checking out worktrees in the `.dotfiles` bare repo.
use `cfg` in place of git `cfg status`, `cfg add <new config file>`.
to checkout a different branch for a work computer or personal computer use `cfg checkout <branch>`.

```bash
curl -Lks https://raw.githubusercontent.com/pitoniak32/.dotfiles/main/.local/bin/install_dotfiles_fresh.sh | /bin/bash
```

# Requirements to use?
## Assumptions
- (If you are on mac) You have [`brew`](https://brew.sh/) installed
- You have installed the recommended dependencies
  - [ ] zsh
  - [ ] stow
  - [ ] git
  - [ ] ripgrep
  - [ ] [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
  - [ ] [kubectx](https://github.com/ahmetb/kubectx#installation)

```bash
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
