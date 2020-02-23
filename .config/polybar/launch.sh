#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Set online battery
export BATTERY="BAT$(cat /sys/class/power_supply/AC/online)"

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  MONITOR=$m polybar --reload simple &
done
