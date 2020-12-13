#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
# polybar example -c ~/.config/polybar/config.ini
/home/ms/tank/Projects/polybar-3.5.0/build/bin/polybar example -c ~/.config/polybar/config.ini
