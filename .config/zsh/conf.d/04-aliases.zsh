# --------------------------------
# Aliases
# --------------------------------
alias g='git'
alias k='kubectl'

alias wttr='curl wttr.in/kgon'
alias moon='curl wttr.in/moon'

alias rm='rm -I'
alias ..="cd .."

if [[ $HOST == "jawnix" || $HOST == "lemurpro" || $HOST == "d" ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi
