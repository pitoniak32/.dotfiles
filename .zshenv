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
SHELL_SESSION_DISABLE=1
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1200000
SAVEHIST=1000000
ZDOTDIR=$HOME/.config/zsh

# Non defaults to clean $HOME
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Source cargo env
. "$CARGO_HOME/env"

shared_linux_configs() {
    export PROJ_DIR=$HOME/Documents/
    source /usr/share/fzf/key-bindings.zsh

    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

    export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
    export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
}

# -------------------------------------------------------------------------
# END Shared Configuration
# -------------------------------------------------------------------------

# -------------------------------------------------------------------------
# BEGIN Machine Specific Configuration
# -------------------------------------------------------------------------
if [[ $HOST == "jawnix" || $HOST == "lemurpro" ]]; then
    # Personal Config (Manjaro)
    export PROJ_DIR=$HOME/Documents/
    source /usr/share/fzf/key-bindings.zsh

    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

    export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
    export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
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
    if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi
    # The next line enables shell command completion for gcloud.
    if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun" # bun completions
fi

