ZSH_THEME=robbyrussell
export ZSH="$HOME/.oh-my-zsh"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/

export EDITOR=nvim
export VISUAL=$EDITOR

# NOTE: must set plugins before sourcin oh-my-zsh
plugins=(
  aliases # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases#aliases-cheatsheet
  profiles # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/profiles#profiles-plugin
  encode64 # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/encode64#encode64
  themes # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/themes#themes-plugin
  git
  kubectl
)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.local/bin/:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
