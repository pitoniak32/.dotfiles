export EDITOR=nvim
export VISUAL=$EDITOR
export PATH="$HOME/.local/bin/:$PATH"

starship init fish --print-full-init | source

eval $(/opt/homebrew/bin/brew shellenv)

