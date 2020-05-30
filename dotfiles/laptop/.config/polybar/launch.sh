#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar_bottom.log /tmp/polybar_top.log

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -l info bottom >>/tmp/polybar_bottom.log 2>&1 &
    MONITOR=$m polybar -l info top >>/tmp/polybar_top.log 2>&1 &

  done
else
  polybar --reload example &
fi

# Launch bar1 and bar2
# polybar -l info bottom >>/tmp/polybar_bottom.log 2>&1 &
# polybar -l info top >>/tmp/polybar_top.log 2>&1 &

echo "Bars launched..."
