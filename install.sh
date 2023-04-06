#!/bin/sh

# script to automate new computer setup

if [[ -z XDG_CONFIG_HOME ]] || [[ -z XDG_DATA_HOME ]]; then
  exit 1;
fi

# -------------------------------------------------------
# Guard ensuring prerequisites are installed.
# -------------------------------------------------------
zsh --version && fzf --version

if [[ $? -ne 0 ]]; then
  echo "Please Ensure Programs Are Installed."
  exit 1
fi

# -------------------------------------------------------
# Set default SHELL to zsh
# -------------------------------------------------------
chsh -s $(which zsh)

# -------------------------------------------------------
# clone dotfiles to home 
# -------------------------------------------------------
git clone https://github.com/pitoniak32/.dotfiles.git $HOME/.dotfiles

# -------------------------------------------------------
# checkout .dotfiles working tree into $HOME 
# -------------------------------------------------------
cfg checkout

# -------------------------------------------------------
# Install packer for nvim 
# -------------------------------------------------------
git clone --depth 1 https://github.com/wbthomason/packer.nvim $XDG_DATA_HOME/nvim/site/pack/packer/start/packer.nvim

# -------------------------------------------------------
# Install rust
# -------------------------------------------------------
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# -------------------------------------------------------
# Install dependencies with cargo 
# -------------------------------------------------------
cargo install --locked bat zellij starship ripgrep

# -------------------------------------------------------
# Clone zsh "plugins"
# -------------------------------------------------------
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git $HOME/zsh-completions

# -------------------------------------------------------
# FINAL STEPS OF INSTALL 
# -------------------------------------------------------
source $ZDOTDIR/.zshrc
