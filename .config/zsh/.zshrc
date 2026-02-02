# Copy autoload functionality from fish
# ref: https://github.com/mattmc3/zshrc.d/blob/09fe190718cff2d7cb08ce30794a7938316ca976/zshrcd.zsh#L17
typeset -ga _zshrcd=("$ZDOTDIR/conf.d"/*.{sh,zsh}(N))
typeset -g _zshrcd_file
for _zshrcd_file in ${(o)_zshrcd}; do
  [[ ${_zshrcd_file:t} != '~'* ]] || continue  # ignore tilde files
  source "$_zshrcd_file"
done
unset _zshrcd{,_file}

# --------------------------------
# Configuration
# --------------------------------
export EDITOR=nvim
export VISUAL=$EDITOR
export PATH=$HOME/.local/bin:$PATH
export AXL_DEFAULT_MULTIPLEXER=tmux

source <(fzf --zsh)
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"
eval "$(fnox activate zsh)"
export FNOX_AGE_KEY=$(cat ~/.config/fnox/age.txt | grep "AGE-SECRET-KEY")

if [[ $HOST == "jawnix" || $HOST == "lemurpro" || $HOST == "d" || $HOST == "mukduk" ]]; then
  export XDG_PROJECT_HOME="$HOME/Projects"
  export AXL_PROJECTS_CONFIG_PATH=$XDG_CONFIG_HOME/axl/personal_projects.yml
  export FLYCTL_INSTALL="/home/davidpi/.fly"
  export PATH="$FLYCTL_INSTALL/bin:/opt/nvim-linux64/bin:$HOME/.npm-global/bin:$PATH"

  if [ -f "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc"; fi
  if [ -f "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc"; fi

  if [[ $HOST == "d" ]]; then
    unset DISPLAY
  fi
fi

if [[ $HOST == "YFCRWDX2QT" ]]; then
  export XDG_PROJECT_HOME="$HOME/Projects/quark"
  export PATH=$HOME/ukg/local/bin:$PATH
  export AXL_PROJECTS_CONFIG_PATH=$XDG_CONFIG_HOME/axl/work_projects.yml
  export QUARK_BANNER_OFF=true

  export CLOUDSDK_PYTHON="/usr/local/bin/python3"
  if [ -f "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/path.zsh.inc"; fi
  if [ -f "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$XDG_DATA_HOME/google-cloud-sdk/completion.zsh.inc"; fi
fi
