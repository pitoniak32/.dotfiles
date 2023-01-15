#!/bin/bash

git clone --bare git@github.com:pitoniak32/.dotfiles.git $HOME/.dotfiles
mkdir -p .config-backup
function cfg_func {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
cfg_func checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  cfg_func checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
cfg_func checkout
cfg_func config status.showUntrackedFiles no
