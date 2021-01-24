#!/usr/bin/env bash

CONFIG_FILE=~/.config/polybar/config

# Terminate already running bar instances
polybar-msg cmd quit

# wait until all processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "---" | tee -a /tmp/polybar_bottom.log /tmp/polybar_top.log
echo "---" | tee -a /tmp/polybar_bottom2.log 


MONITOR="DP-4" polybar -l info bottom -c $CONFIG_FILE >>/tmp/polybar_bottom.log 2>&1 &
MONITOR="DP-4" polybar -l info top -c $CONFIG_FILE >>/tmp/polybar_top.log 2>&1 &

MONITOR="DP-0" polybar -l info bottom2 -c $CONFIG_FILE >>/tmp/polybar_bottom2.log 2>&1 &

echo "Bars launched..."
