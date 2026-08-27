setopt prompt_subst hist_ignore_all_dups menucomplete share_history nomenucomplete

# This enables arrow keys to use already typed commands to search history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# This enables editing commands in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

zmodload zsh/zprof
zmodload zsh/complist
autoload -Uz compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION && compinit

autoload -U colors && colors
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

# Try using only atuin history
unset HISTFILE

# Allow comments in shell commands
setopt INTERACTIVE_COMMENTS
