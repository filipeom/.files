#!/bin/sh

xprofile=$HOME/.xprofile
userresources=$XDG_CONFIG_HOME/Xresouces
usermodmap=$XDG_CONFIG_HOME/Xmodmap

[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"
[ -f "$xprofile" ] && . "$xprofile"

exec bspwm
