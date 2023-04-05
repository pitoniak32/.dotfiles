# loading without oh-my-zsh

# setopt prompt_subst
# autoload -U promptinit && promptinit
# autoload -U colors && colors
# setopt hist_ignore_all_dups

HISTFILE=$HOME/.zsh_history

HISTSIZE=1000000
SAVEHIST=1000000

source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/zsh-autosuggestions/zsh-autosuggestions.zsh

# aliases
alias g='git'
alias k='kubectl'
alias ls='ls --color'
alias dka='docker kill $(docker ps -q)'
alias dcu='~/docker-m1/update-topics.sh; docker compose -f docker-compose.yml -f ~/docker-m1/docker-compose.arm.yml up -d'
alias dcd='docker compose -f docker-compose.yml -f ~/docker-m1/docker-compose.arm.yml down'

# User configuration
export EDITOR=nvim
export VISUAL=$EDITOR
export PATH=$HOME/.local/bin/:$PATH
export PATH=$HOME/ukg/local/bin/:$PATH

export PROJ_DIR=$HOME/Documents/quark

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/davidpi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/davidpi/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/davidpi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/davidpi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
