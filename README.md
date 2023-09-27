# Bare Dotfiles Repo

OP: https://www.atlassian.com/git/tutorials/dotfiles

When using this method you should avoid checking out worktrees in the `.dotfiles` bare repo.
use `cfg` in place of git `cfg status`, `cfg add <new config file>`.

## Setup

```bash
git clone --bare git@github.com:pitoniak32/.dotfiles.git $HOME/.dotfiles

alias cfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

cfg checkout
```
