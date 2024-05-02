# These configurations we might not change often
export PATH="$HOME"/.local/bin:"$PATH"

# User
export EDITOR="nvim"
export TERMINAL="kitty"
export FILE="ranger"
export BROWSER="firefox"
export DEFAULT_USER="filipe"

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_PICTURES_DIR="$HOME"/pic

# ZSH
export ZSH="$XDG_DATA_HOME"/zsh/oh-my-zsh
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history

# Texlive
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

# Python
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME"/python
export PYTHONUSERBASE="$XDG_DATA_HOME"/python

# Misc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export WWW_HOME="$XDG_DATA_HOME"/w3m
export PLTUSERHOME="$XDG_DATA_HOME"/racket
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
export LESSHISTFILE=-
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export OPAMROOT="$XDG_DATA_HOME"/opam
export SSB_HOME="$XDG_DATA_HOME"/zoom
export SQLITE_HISTORY="$XDG_DATA_HOME"/sqlite_history
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel

[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx
