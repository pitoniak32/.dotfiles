setopt prompt_subst hist_ignore_all_dups menucomplete SHARE_HISTORY
zmodload zsh/complist

autoload -Uz compinit
autoload -U colors && colors
autoload -U promptinit && promptinit 

# PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %{$fg[cyan]%}%c %{$reset_color%}%{\${vcs_info_msg_0_}%}%(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ )%{$reset_color%}"
# PROMPT="%B%{$fg[black]%}[%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[cyan]%}%m%{$fg[black]%}] [%{$fg[cyan]%}%c%{$fg[black]%}] %(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ )%{$reset_color%}"

# --------------------------------
# Custom scripts
# --------------------------------
source $ZDOTDIR/zsh_aliases
source $ZDOTDIR/zsh_vimode
# source $ZDOTDIR/zsh_vcsprompt

if [[ -v $WORK_MACHINE ]]; then
  source $ZDOTDIR/zsh_work_machine
fi

if [[ -v $PERSONAL_MACHINE ]]; then
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/davidpi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/davidpi/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/davidpi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/davidpi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
