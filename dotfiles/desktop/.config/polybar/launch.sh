#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar_bottom.log /tmp/polybar_top.log
polybar -l info bottom >>/tmp/polybar_bottom.log 2>&1 &
polybar -l info top >>/tmp/polybar_top.log 2>&1 &

echo "Bars launched..."
