# XDG standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="$XDG_CONFIG_DIRS:/etc/xdg"

# Zsh config
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export SHELL_SESSION_DISABLE=1
export HISTSIZE=1200000
export SAVEHIST=1200000

# Non defaults to clean $HOME
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Source cargo env
. "$CARGO_HOME/env"

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# If running on mac startup brew
if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/dvd/.bun/_bun" ] && source "/Users/dvd/.bun/_bun"

. "$HOME/.local/share/../bin/env"
