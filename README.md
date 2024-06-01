# Dotfiles

There are currently 2 main-stream methods of managing dotfiles (my current method denoted by `*`):
1. gnu stow *****
2. git bare repos

# Stow
When using this method you need to install [stow](https://www.gnu.org/software/stow/). You are symlinking the `.dotfiles/*` into your `$HOME`.

## Setup

```bash
git clone git@github.com:pitoniak32/.dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
stow .
```

Then just treat `$HOME/.dotfiles` as a normal git repository. When you make changes to files in the repo, or the linked files in your `$HOME`, they will be under the version control of the `.dotfiles` repo.

# Bare Repo

OP: https://www.atlassian.com/git/tutorials/dotfiles

When using this method you should avoid checking out worktrees in the `.dotfiles` bare repo.
use `cfg` in place of git `cfg status`, `cfg add <new config file>`.

## Setup

```bash
git clone --bare git@github.com:pitoniak32/.dotfiles.git $HOME/.dotfiles

alias cfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

cfg checkout
```
