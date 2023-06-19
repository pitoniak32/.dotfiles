# ------------------
# XDG standards
# ------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Zsh config
SHELL_SESSION_DISABLE=1
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1200000
SAVEHIST=1000000
ZDOTDIR=$HOME/.config/zsh

# Non defaults to clean $HOME
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
eval $(dircolors "$XDG_CONFIG_HOME"/dircolors)

# Source cargo env
. "/home/davidpi/.local/share/cargo/env"
