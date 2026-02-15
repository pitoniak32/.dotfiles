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

if [[ $HOST == "jawnix" || $HOST == "lemurpro" || $HOST == "d" ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi
