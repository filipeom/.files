# These configurations we might not change often
export PATH="$HOME"/.local/bin:"$PATH"

# User
export EDITOR="vim"
export TERMINAL="xterm"
export FILE="ranger"
export DEFAULT_USER="filipe"

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_PICTURES_DIR="/data/home/filipe/Pictures"

# ZSH
export ZSH="$XDG_DATA_HOME"/zsh/oh-my-zsh
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history

# Vim
export VIMINIT=":source $XDG_CONFIG_HOME/vim/init.vim"

# Misc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export WWW_HOME="$XDG_DATA_HOME"/w3m
export PLTUSERHOME="$XDG_DATA_HOME"/racket
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
export LESSHISTFILE=-
