# ------------------
# XDG standards
# ------------------
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

SHELL_SESSION_DISABLE=1
HISTFILE=$HOME/.zsh_history
HISTSIZE=1200000
SAVEHIST=1000000
ZDOTDIR=$HOME/.config/zsh

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

. "$HOME/.cargo/env"
