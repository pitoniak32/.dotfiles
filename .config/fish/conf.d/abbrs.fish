# fish
abbr -a fish_config_reload 'for file in $XDG_CONFIG_HOME/fish/**/*.fish; source $file; end'

# git
abbr -a grbom 'git rebase origin/main'
abbr -a --set-cursor gcm 'git commit -m "%"'

# mac
if test (uname) = "Darwin"
  abbr -a --set-cursor pbexp 'set % (pbpaste)'
end

# kubectl
abbr -a kns 'kubectl config view --minify --output "jsonpath={..namespace}"; echo'
abbr -a knss 'kubectl config set-context --current --namespace'

#docker
abbr -a dka 'docker kill $(docker ps -q)'
abbr -a dcu 'docker compose up -d --wait'
abbr -a dcs 'docker compose stop'
abbr -a dcd 'docker compose down'

# general
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd
abbr -a ll 'eza -la'
abbr -a wttr 'curl wttr.in/kgon'
abbr -a moon 'curl wttr.in/moon'
