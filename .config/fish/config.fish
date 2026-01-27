# Fish Options
set fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

# XDG standards
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux XDG_STATE_HOME $HOME/.local/state
set -Ux --path XDG_DATA_DIRS $XDG_DATA_DIRS /usr/local/share:/usr/share
set -Ux --path XDG_CONFIG_DIRS $XDG_CONFIG_DIRS /etc/xdg

# Non defaults to clean $HOME
set -Ux STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml

fish_add_path $HOME/.local/bin/

set -Ux EDITOR nvim
set -Ux VISUAL $EDITOR
set -Ux AXL_DEFAULT_MULTIPLEXER tmux

# If running on mac startup brew
test (uname) = Darwin; and /opt/homebrew/bin/brew shellenv | source

starship init fish --print-full-init | source

set -x PNPM_HOME $XDG_DATA_HOME/pnpm
if not string match -q "*$PNPM_HOME*" "$PATH"
    fish_add_path $PNPM_HOME 
end

# configure SSH to use GPG
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
# start gpg-agent, if it isn't started already
gpgconf --launch gpg-agent
# the docs say to use: gpg-connect-agent /bye
gpg-connect-agent /bye
# Set an environment variable to tell GPG the current terminal.
set -gx GPG_TTY (tty)

direnv hook fish | source
fzf --fish | source
zoxide init fish | source

switch $hostname
  case YFCRWDX2QT
    fish_add_path $HOME/ukg/local/bin

    set -Ux XDG_PROJECT_HOME $HOME/Projects/quark
    set -Ux AXL_PROJECTS_CONFIG_PATH $XDG_CONFIG_HOME/axl/work_projects.yml
    set -Ux QUARK_BANNER_OFF true

    test -f "$XDG_DATA_HOME/google-cloud-sdk/path.bash.inc" && bass source "$XDG_DATA_HOME/google-cloud-sdk/path.bash.inc"
    test -f "$XDG_DATA_HOME/google-cloud-sdk/completion.bash.inc" && bass source "$XDG_DATA_HOME/google-cloud-sdk/completion.bash.inc"

  case '*'
    set -Ux XDG_PROJECT_HOME $HOME/Projects
    set -Ux AXL_PROJECTS_CONFIG_PATH $XDG_CONFIG_HOME/axl/personal_projects.yml
    set -Ux FLYCTL_INSTALL $HOME/.fly
    set -Ux NNN_PLUG 'o:fzopen;x:!chmod +x "$nnn"*;'
    set -Ux BUN_INSTALL "$HOME/.bun"

    fish_add_path $FLYCTL_INSTALL/bin /opt/nvim-linux64/bin $HOME/.npm-global/bin "$BUN_INSTALL/bin"
    test (uname) = Darwin; and fish_add_path /opt/homebrew/opt/postgresql@17/bin


    switch $hostname
      case d
        unset DISPLAY
    end
end

/Users/dvd/.local/bin/mise activate fish | source
