# These configurations we might not change often
export PATH="$HOME"/.local/bin:"$PATH"

# Users variables at login
export EDITOR="nvim"
export TERMINAL="kitty"
export FILE="ranger"
export BROWSER="firefox"
export DEFAULT_USER="filipe"
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_PICTURES_DIR="$HOME"/pictures

# Other variables that need to be set before we start X
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export SSB_HOME="$XDG_DATA_HOME"/zoom

[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx
