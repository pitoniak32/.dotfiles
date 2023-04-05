# autoload -Uz compinit
# autoload -U colors && colors
# autoload -U promptinit && promptinit 

# PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %{$fg[cyan]%}%c %{$reset_color%}%{\${vcs_info_msg_0_}%}%(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ )%{$reset_color%}"
# PROMPT="%B%{$fg[black]%}[%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[cyan]%}%m%{$fg[black]%}] [%{$fg[cyan]%}%c%{$fg[black]%}] %(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ )%{$reset_color%}"

setopt prompt_subst hist_ignore_all_dups menucomplete SHARE_HISTORY
zmodload zsh/complist

# --------------------------------
# Custom scripts
# --------------------------------
source $ZDOTDIR/zsh_aliases
source $ZDOTDIR/zsh_vimode
# source $ZDOTDIR/zsh_vcsprompt

if [[ -n $WORK_MACHINE ]]; then
  source $ZDOTDIR/zsh_work_machine
fi

if [[ -n $PERSONAL_MACHINE ]]; then
  source $ZDOTDIR/zsh_personal_machine
fi

# --------------------------------
# Plugins
# --------------------------------
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/zsh-autosuggestions/zsh-autosuggestions.zsh

# --------------------------------
# Configuration
# --------------------------------
export EDITOR=nvim
export VISUAL=$EDITOR
export PATH=$HOME/.local/bin/:$PATH

[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh

eval "$(starship init zsh)"
