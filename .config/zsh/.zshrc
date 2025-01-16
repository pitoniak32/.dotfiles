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

zmodload zsh/zprof
zmodload zsh/complist
autoload -Uz compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION && compinit

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

eval "$(direnv hook zsh)"

eval "$(starship init zsh)"

source <(fzf --zsh)

eval "$(zoxide init zsh)"

function epyenv() {
  export PYENV_ROOT="$XDG_DATA_HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
}

# function egcloud() {
#   # requires that pyenv has been evaluated before this runs.
#   export CLOUDSDK_PYTHON="$XDG_DATA_HOME/.pyenv/shims/python3.11"
#   if [ -f "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc"; fi
#   if [ -f "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc"; fi
# }

FNM_HOME="$XDG_DATA_HOME/fnm"
if [ -d "$FNM_HOME" ]; then
  export PATH="$FNM_HOME:$PATH"
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

if [[ $HOST == "jawnix" || $HOST == "lemurpro" || $HOST == "d" || $HOST == "mukduk" || $HOST == "dvd.local" ]]; then
  export XDG_PROJECT_HOME="$HOME/Projects"
  export AXL_PROJECTS_CONFIG_PATH=$XDG_CONFIG_HOME/axl/personal_projects.yml
  export FLYCTL_INSTALL="/home/davidpi/.fly"
  export PATH="/usr/local/go/bin:$HOME/go/bin:$FLYCTL_INSTALL/bin:/opt/nvim-linux64/bin:$HOME/.npm-global/bin:$PATH"

  if [[ $HOST == "d" ]]; then
    unset DISPLAY
  fi
fi

if [[ $HOST == "YFCRWDX2QT" ]]; then
  export XDG_PROJECT_HOME="$HOME/Projects/quark"
  export PATH=$HOME/ukg/local/bin:$PATH
  export AXL_PROJECTS_CONFIG_PATH=$XDG_CONFIG_HOME/axl/work_projects.yml
  export QUARK_BANNER_OFF=true

  # epyenv
  # egcloud
fi
