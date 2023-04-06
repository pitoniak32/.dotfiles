SHELL_SESSION_DISABLE=1
HISTFILE=$HOME/.zsh_history
HISTSIZE=1200000
SAVEHIST=1000000
ZDOTDIR=$HOME/.config/zsh

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export MACHINE_WORK="true"

export GPG_TTY=$(tty)

. "$HOME/.cargo/env"
