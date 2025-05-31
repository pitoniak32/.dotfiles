abbr --set-cursor -a gcm 'git commit -m "%"'
abbr --set-cursor -a pbexp 'set % (pbpaste)'

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

abbr -a ll 'eza -la'

abbr -a wttr 'curl wttr.in/kgon'
abbr -a moon 'curl wttr.in/moon'

abbr -a kns 'kubectl config view --minify --output "jsonpath={..namespace}"; echo'
abbr -a knss 'kubectl config set-context --current --namespace'

abbr -a dka 'docker kill $(docker ps -q)'
abbr -a dcu 'docker compose up -d --wait'
abbr -a dcs 'docker compose stop'
abbr -a dcd 'docker compose down'
