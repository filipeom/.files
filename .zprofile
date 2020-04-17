# These configurations we might not change often
export PATH="$HOME/.local/bin:$PATH"

export EDITOR="vim"
export TERMINAL="termite"
export FILE="ranger"
export DEFAULT_USER="filipe"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export ZSH="$XDG_DATA_HOME/zsh/oh-my-zsh"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export VAGRANT_HOME="/data/home/filipe/.vagrant.d"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WWW_HOME="$XDG_DATA_HOME/w3m"
export PLTUSERHOME="$XDG_DATA_HOME/racket"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export VIMINIT=":source $XDG_CONFIG_HOME/vim/vimrc"
export LESSHISTFILE=-

if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx
