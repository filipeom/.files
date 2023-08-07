#!/bin/sh

export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11

xprofile=$HOME/.xprofile
userresources=$XDG_CONFIG_HOME/Xresources
usermodmap=$XDG_CONFIG_HOME/Xmodmap

[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"
[ -f "$xprofile" ] && . "$xprofile"

exec dwm
