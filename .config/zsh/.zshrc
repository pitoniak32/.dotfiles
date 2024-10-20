# load zsh_helpers
source $ZDOTDIR/.zsh_helpers

setopt prompt_subst hist_ignore_all_dups menucomplete share_history nomenucomplete

# This enables arrow keys to use already typed commands to search history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

zmodload zsh/complist
# autoload -Uz compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION && compinit

autoload -U colors && colors
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# Ignore all commands from history that match the patterns
export HISTORY_IGNORE="*PRIVATE KEY*|*SECRET*"

export HISTFILE="$XDG_STATE_HOME/zsh/.zsh_history"
ensure_parent_dir $HISTFILE

# --------------------------------
# Custom scripts
# --------------------------------
source $ZDOTDIR/zsh_aliases
source $ZDOTDIR/zsh_vimode
# source $ZDOTDIR/zsh_vcsprompt

# --------------------------------
# Plugins
# --------------------------------
load_zsh_plugin "${XDG_DATA_HOME}/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
load_zsh_plugin "${XDG_DATA_HOME}/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Needs to be loaded after zsh-syntax-highlighting...
load_zsh_plugin "${XDG_DATA_HOME}/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Turn off annoying highlighting
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=none
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=none

# Bind arrow keys to history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# fpath=($XDG_DATA_HOME/zsh/zsh-completions/src $fpath)

# --------------------------------
# Configuration
# --------------------------------
export EDITOR=nvim
export VISUAL=$EDITOR
export PATH=$HOME/.local/bin:$PATH
export AXL_DEFAULT_MULTIPLEXER=tmux

# configure SSH to use GPG
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# start gpg-agent, if it isn't started already
gpgconf --launch gpg-agent
# the docs say to use: gpg-connect-agent /bye
gpg-connect-agent /bye
# Set an environment variable to tell GPG the current terminal.
export GPG_TTY=$(tty)

eval "$(starship init zsh)"

source <(fzf --zsh)

if [[ $HOST == "jawnix" || $HOST == "lemurpro" || $HOST == "d" || $HOST == "pop-os" ]]; then
    # Personal Config (Manjaro)
    export AXL_PROJECTS_CONFIG_PATH=$XDG_CONFIG_HOME/axl/personal_projects.yml

    export FLYCTL_INSTALL="/home/davidpi/.fly"
    export PATH="/usr/local/go/bin:$HOME/go/bin:$FLYCTL_INSTALL/bin:/opt/nvim-linux64/bin:$HOME/.npm-global/bin:$PATH"

    # fnm
    FNM_PATH="/home/dvd/.local/share/fnm"
    if [ -d "$FNM_PATH" ]; then
      export PATH="/home/dvd/.local/share/fnm:$PATH"
      eval "`fnm env`"
    fi

    if [[ $HOST == "d" ]]; then
      unset DISPLAY
    fi
fi

if [[ $HOST == "YFCRWDX2QT" ]]; then
    # Work Machine Config (MacBook Pro M1)
    eval "$(/opt/homebrew/bin/brew shellenv)"

    export PATH=$HOME/ukg/local/bin:$PATH
    export AXL_PROJECTS_CONFIG_PATH=$XDG_CONFIG_HOME/axl/work_projects.yml
    export QUARK_BANNER_OFF=true

    export CLOUDSDK_PYTHON="/opt/homebrew/bin/python3.11"
    if [ -f "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc"; fi
    if [ -f "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc"; fi

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm but disables the auto-use feature for speed reasons
fi
