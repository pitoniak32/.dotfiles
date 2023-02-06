ZSH_THEME=robbyrussell
export ZSH="$HOME/.oh-my-zsh"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/

# NOTE: must set plugins before sourcin oh-my-zsh

export EDITOR=vim
export VISUAL=$EDITOR

export COMPOSE_DOCKER_CLI_BUILD=0
export DOCKER_BUILDKIT=0

plugins=(
  aliases # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases#aliases-cheatsheet
  profiles # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/profiles#profiles-plugin
  encode64 # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/encode64#encode64
  themes # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/themes#themes-plugin
  git
  kubectl
)

source "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.local/bin/:$PATH"
export PROJ_DIR="$HOME/Documents/quark"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

export PROJ_DIR="$HOME/Documents/quark"
export WE_MISS_YOU="UkdGeVpXc0sK"
export QUARK_BANNER_OFF=true

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/davidpi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/davidpi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/davidpi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/davidpi/google-cloud-sdk/completion.zsh.inc'; fi
