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

autoload -U compinit && compinit
autoload -U colors && colors

zmodload zsh/complist

compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
# --------------------------------
# Custom scripts
# --------------------------------
source $ZDOTDIR/zsh_aliases
source $ZDOTDIR/zsh_vimode
# source $ZDOTDIR/zsh_vcsprompt

# --------------------------------
# Determine what machine
# --------------------------------
if [[ $HOST == "jawnix" ]]; then
  source $ZDOTDIR/zsh_personal_machine
elif [[ $HOST ==  "YFCRWDX2QT" ]]; then
  source $ZDOTDIR/zsh_work_machine
elif [[ $HOST == "" ]]; then
  source $ZDOTDIR/zsh_system76
fi

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
export GPG_TTY=$(tty)

eval "$(starship init zsh)"
