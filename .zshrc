# theme loading without oh-my-zsh
setopt prompt_subst

autoload -U promptinit && promptinit
autoload -U colors && colors

source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/.zsh/git.zsh
source $HOME/.config/.zsh/robbyrussel.zsh-theme

# aliases
alias g='git'
alias ls='ls --color'
alias dka='docker kill $(docker ps -q)'
alias dcu='~/docker-m1/update-topics.sh; docker compose -f docker-compose.yml -f ~/docker-m1/docker-compose.arm.yml up -d'
alias dcd='docker compose -f docker-compose.yml -f ~/docker-m1/docker-compose.arm.yml down'

# User configuration
export EDITOR=nvim
export VISUAL=$EDITOR
export PATH="$HOME/.local/bin/:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
