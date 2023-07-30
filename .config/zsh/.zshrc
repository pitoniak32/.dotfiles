# PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %{$fg[cyan]%}%c %{$reset_color%}%{\${vcs_info_msg_0_}%}%(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ )%{$reset_color%}"
# PROMPT="%B%{$fg[black]%}[%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[cyan]%}%m%{$fg[black]%}] [%{$fg[cyan]%}%c%{$fg[black]%}] %(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ )%{$reset_color%}"

setopt prompt_subst hist_ignore_all_dups menucomplete share_history nomenucomplete

# This enables arrow keys to use already typed commands to search history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

autoload -U colors && colors
autoload -U compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zmodload zsh/complist
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
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/zsh-autosuggestions/zsh-autosuggestions.zsh

fpath=($HOME/zsh-completions/src $fpath)

# --------------------------------
# Configuration
# --------------------------------
export EDITOR=nvim
export VISUAL=$EDITOR
export PATH=$HOME/.local/bin:$HOME/.config/emacs/bin:$PATH
# configure SSH to use GPG
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# start gpg-agent, if it isn't started already
gpgconf --launch gpg-agent
# the docs say to use: gpg-connect-agent /bye
gpg-connect-agent /bye
# Set an environment variable to tell GPG the current terminal.
export GPG_TTY=$(tty)

eval "$(starship init zsh)"
