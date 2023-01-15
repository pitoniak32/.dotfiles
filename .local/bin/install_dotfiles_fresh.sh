#!/bin/bash

config_dir_name=".dotfiles"

git clone --bare git@github.com:pitoniak32/.dotfiles.git $HOME/$config_dir_name
function config {
   /usr/bin/git --git-dir=$HOME/$config_dir_name/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
