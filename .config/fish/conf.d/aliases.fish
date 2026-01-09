alias g 'git'
alias k 'kubectl'
alias rm 'rm -I'

alias cksha256 'echo "$1" "$2" | sha256sum --check'

switch $hostname
    case jawnix lemurpro d
        alias pbcopy 'xclip -selection clipboard'
        alias pbpaste 'xclip -selection clipboard -o'
end
