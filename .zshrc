ZSH_THEME=robbyrussell
export ZSH="$HOME/.oh-my-zsh"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/

# NOTE: must set plugins before sourcin oh-my-zsh

plugins=(git)

source $ZSH/oh-my-zsh.sh

# eval "$(pyenv init -)"

export PATH="$HOME/.local/bin/:$PATH"
export JDTLS_HOME="$HOME/.local/share/nvim/lsp_servers/jdtls"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=nvim
