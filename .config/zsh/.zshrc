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

# --------------------------------
# Custom scripts
# --------------------------------
source $ZDOTDIR/zsh_aliases
source $ZDOTDIR/zsh_vimode
# source $ZDOTDIR/zsh_vcsprompt

# --------------------------------
# Plugins
# --------------------------------
syn_highlight_dir_path="${XDG_DATA_HOME}/zsh/zsh-syntax-highlighting/"
syn_highlight_file_path="${syn_highlight_dir_path}zsh-syntax-highlighting.zsh"

if [[ ! -f $syn_highlight_file_path ]]; then
  echo "Cloning zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $syn_highlight_dir_path
fi
source $syn_highlight_file_path

autosuggest_dir_path="${XDG_DATA_HOME}/zsh/zsh-autosuggestions/"
autosuggest_file_path="${autosuggest_dir_path}zsh-autosuggestions.zsh"

if [[ ! -f $autosuggest_file_path ]]; then
  echo "Cloning zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $autosuggest_dir_path
fi
source $autosuggest_file_path

fpath=($XDG_DATA_HOME/zsh/zsh-completions/src $fpath)

# --------------------------------
# Configuration
# --------------------------------
export EDITOR=nvim
export VISUAL=$EDITOR
export PATH=$HOME/.local/bin:$HOME/.config/emacs/bin:$PATH
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

if [[ $HOST == "jawnix" || $HOST == "lemurpro" || $HOST == "d" ]]; then
    # Personal Config (Manjaro)
    export AXL_PROJECTS_CONFIG_PATH=$XDG_CONFIG_HOME/axl/personal_projects.yml

    eval `keychain --quiet --eval --agents ssh,gpg id_ed25519_personal F37BD0CEA2ADFAA9`

    export FLYCTL_INSTALL="/home/davidpi/.fly"
    export PATH="/usr/local/go/bin:$HOME/go/bin:$FLYCTL_INSTALL/bin:$PATH"

    if [[ $HOST == "d" ]]; then
      fzf_keys=/usr/share/doc/fzf/examples/key-bindings.zsh
      fzf_comp=/usr/share/doc/fzf/examples/completion.zsh
    else
    # fzf_keys="$XDG_DATA_HOME/fzf/key-bindings.zsh"
    # fzf_comp="$XDG_DATA_HOME/fzf/completion.zsh"
      fzf_keys=/usr/share/fzf/key-bindings.zsh
      fzf_comp=/usr/share/fzf/completion.zsh
    fi

    if [[ ! -f $fzf_keys || ! -f $fzf_comp ]]; then
      echo "Check fzf docs for where to find the file(s):"
      echo "$fzf_keys exists:" $(test -e $fzf_keys && echo "true" || echo "false")
      echo "$fzf_comp exists:" $(test -e $fzf_comp && echo "true" || echo "false")
    else
      source $fzf_keys $fzf_comp
    fi
fi

if [[ $HOST == "YFCRWDX2QT" ]]; then
    # Work Machine Config (MacBook Pro M1)
    eval "$(/opt/homebrew/bin/brew shellenv)"

    export PATH=$HOME/ukg/local/bin:$PATH
    export AXL_PROJECTS_CONFIG_PATH=$XDG_CONFIG_HOME/axl/work_projects.yml
    export QUARK_BANNER_OFF=true

    if [ -f $ZDOTDIR/fzf.zsh ]; then source $ZDOTDIR/fzf.zsh; else echo "INSTALL ZSH FZF."; fi

    export CLOUDSDK_PYTHON="/opt/homebrew/bin/python3.11"
    if [ -f "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc"; fi
    if [ -f "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc"; fi

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun" # bun completions
fi
