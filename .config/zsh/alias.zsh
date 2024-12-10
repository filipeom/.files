#!/bin/zsh

# Aliases
alias e="$EDITOR"
alias vi="nvim"
alias vim="nvim"

# Binds
bindkey -s ^f "tmux-sessionizer\n"

# dotfiles
alias .f='/usr/bin/git --git-dir="$HOME/.files/" --work-tree="$HOME"'
alias .fs=".f status --short"
