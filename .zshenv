# -------------------------------------------------------------------------
# BEGIN Shared Configuration
# -------------------------------------------------------------------------

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

# -------------------------------------------------------------------------
# END Shared Configuration
# -------------------------------------------------------------------------

# -------------------------------------------------------------------------
# BEGIN Machine Specific Configuration
# -------------------------------------------------------------------------
if [[ $HOST == "jawnix" || $HOST == "lemurpro" || $HOST == "d" ]]; then
    # Personal Config (Manjaro)
    export PROJ_DIR=$HOME/Documents/

    fzf_keys="$XDG_DATA_HOME/fzf/key-bindings.zsh"
    fzf_comp="$XDG_DATA_HOME/fzf/completion.zsh"

    if [[ ! -f $fzf_keys || ! -f $fzf_comp ]]; then
      echo "Check fzf docs for where to find the file(s):"
      echo "$fzf_keys exists:" $(test -e $fzf_keys && echo "true" || echo "false")
      echo "$fzf_comp exists:" $(test -e $fzf_comp && echo "true" || echo "false")
    else
      source $fzf_keys $fzf_comp
    fi

    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

if [[ $HOST == "YFCRWDX2QT" ]]; then
    # Work Machine Config (MacBook Pro M1)
    eval "$(/opt/homebrew/bin/brew shellenv)"

    export PATH=$HOME/ukg/local/bin/:$PATH
    export PROJ_DIR=$HOME/Documents/quark
    export QUARK_BANNER_OFF=true
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"

    if [ -f $HOME/.fzf.zsh ]; then source $HOME/.fzf.zsh; else echo "INSTALL ZSH FZF."; fi

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc"; fi
    # The next line enables shell command completion for gcloud.
    if [ -f "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc"; fi

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun" # bun completions
fi

