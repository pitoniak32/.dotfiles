# XDG standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Zsh config
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export SHELL_SESSION_DISABLE=1
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=1200000
export SAVEHIST=1000000

# Non defaults to clean $HOME
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Source cargo env
. "$CARGO_HOME/env"
