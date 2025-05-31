alias g 'git'
alias k 'kubectl'
alias rm 'rm -I'

switch $hostname
    case jawnix lemurpro d
        alias pbcopy 'xclip -selection clipboard'
        alias pbpaste 'xclip -selection clipboard -o'
end
