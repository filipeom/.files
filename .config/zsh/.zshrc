# plugins=(git encode64 extract archlinux zsh-syntax-highlighting)

# History
HISTSIZE=500000
SAVEHIST=500000
## Ignore duplicated commands history list
setopt hist_ignore_dups
## Ignore commands that start with space
setopt hist_ignore_space
## Append commands to history
setopt share_history

# Colors
autoload -U colors && colors
autoload -Uz add-zsh-hook vcs_info

setopt prompt_subst
#
# Run the `vcs_info` hook to grab git info before displaying the prompt
add-zsh-hook precmd vcs_info
#
# Style the vcs_info message
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats ' %F{blue}git(%f%F{red}%b%f%F{yellow}%u%f%F{blue})%f'
# Format when the repo is in an action (merge, rebase, etc)
zstyle ':vcs_info:git*' actionformats ' %*'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
# This enables %u and %c (unstaged/staged changes) to work,
# but can be slow on large repos
zstyle ':vcs_info:*:*' check-for-changes true

# Set the right prompt to the vcs_info message

## Prompt
PROMPT='%B%(?.%F{green}󰘍.%F{red}󰘍)%f %F{cyan}%2~%f${vcs_info_msg_0_}%{$reset_color%}%b '
# RPROMPT='%*'

#
## Start typing + [Up-Arrow] - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search

## Start typing + [Down-Arrow] - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[B" down-line-or-beginning-search

## [Home] - Go to beginning of line
bindkey "^[[H" beginning-of-line
## [End] - Go to end of line
bindkey "^[[F" end-of-line

# [Backspace] - delete backward
bindkey '^?' backward-delete-char

# [Delete] - delete forward
bindkey "^[[3~" delete-char

# [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word
#
# [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word
#
# [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward
# [Space] - don't do history expansion
bindkey ' ' magic-space

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-e' edit-command-line

# Completion
autoload -U compinit && compinit
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# bindkey -M menuselect '^o' accept-and-infer-next-history
zstyle ':completion:*:*:*:*:*' menu select
#
# Complete . and .. special directories
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''

zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# Include hidden files in autocomplete
#_comp_options+=(globdots)

# Source aliases
source "${ZDOTDIR}/alias.zsh"

# Source auxiliary functions
source "${ZDOTDIR}/functions.zsh"

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$(npm config get prefix)/bin":$PATH

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
