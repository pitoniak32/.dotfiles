
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

zstyle ':completion:*' menu select

# --------------------------------
# Custom scripts
# --------------------------------
source $ZDOTDIR/zsh_aliases
source $ZDOTDIR/zsh_vimode
# source $ZDOTDIR/zsh_vcsprompt

if [[ -n $MACHINE_WORK ]]; then
  source $ZDOTDIR/zsh_work_machine
fi

if [[ -n $MACHINE_DESKTOP ]]; then
  source $ZDOTDIR/zsh_personal_machine
fi

if [[ -n $MACHINE_SYS76 ]]; then
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
export PATH=$HOME/.local/bin/:$PATH

if [ -f $HOME/.fzf.zsh ]; then source $HOME/.fzf.zsh; else echo "INSTALL ZSH FZF."; fi

eval "$(starship init zsh)"
