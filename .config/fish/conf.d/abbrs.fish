# fish
abbr -a fish_config_reload 'for file in $XDG_CONFIG_HOME/fish/**/*.fish; source $file; end'
abbr -a abbr-edit 'nvim $XDG_CONFIG_HOME/fish/conf.d/abbrs.fish'

# git
abbr -a grbm 'git rebase origin/main'
abbr -a --set-cursor gcm 'git commit -m "%"'
abbr -a gcrom 'git checkout main && git rom'

# mac
if test (uname) = "Darwin"
  abbr -a --set-cursor pbexp 'set % (pbpaste)'
end

# kubectl
abbr -a kns 'kubectl config view --minify --output "jsonpath={..namespace}"; echo'
abbr -a knss 'kubectl config set-context --current --namespace'

# helm
abbr -a helm-login 'gcloud auth print-access-token | helm registry login -u oauth2accesstoken --password-stdin https://us-docker.pkg.dev'

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

switch $hostname
  case YFCRWDX2QT
    abbr -a 'td-serve' 'bass source ./scripts/init-td && npx @techdocs/cli serve --no-docker'
    abbr -a 'ncu' 'npx npm-check-updates -ui --timeout=1000000000'
    abbr -a 'claude' 'pnpx @anthropic-ai/claude-code'
    abbr -a --set-cursor 'giam' 'gcloud projects get-iam-policy % --flatten="bindings[].members[]" --filter="bindings.role:roles/secretmanager" --format="table(bindings.role, bindings.members)"'
  case '*'
end

