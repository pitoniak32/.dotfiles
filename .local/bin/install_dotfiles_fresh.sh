#!/bin/bash

git clone --bare git@github.com:pitoniak32/.dotfiles.git $HOME/.dotfiles
mkdir -p .config-backup
cfg checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    cfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
cfg checkout
cfg config status.showUntrackedFiles no
