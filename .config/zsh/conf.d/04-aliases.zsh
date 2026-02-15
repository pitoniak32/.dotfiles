# --------------------------------
# Aliases
# --------------------------------
alias g='git'
alias ggc='git a && g c "."' # a quick "stash" for current changes
alias k='kubectl'

alias wttr='curl wttr.in/kgon'
alias moon='curl wttr.in/moon'

alias ll='eza -la'
alias rm='rm -I'
alias ..='cd ..'
alias mr='mise run'
alias mx='mise exec'

if [[ $(uname) == "Darwin" ]]; then
  alias cmdc='pbcopy'
  alias cmdv='pbpaste'
fi

if [[ $HOST == "jawnix" || $HOST == "lemurpro" || $HOST == "d" ]]; then
  alias cmdc='xclip -selection clipboard'
  alias cmdv='xclip -selection clipboard -o'
fi
