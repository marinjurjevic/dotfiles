#!/bin/bash

x_mouse=$(xdotool getmouselocation | cut -d ' ' -f1 | cut -d ':' -f2) 
x_offset=$(( $x_mouse - 80 ))

# polybar height
y_offset=-25

selection=$(rofi -theme ssh_sessions -modi "sshc:~/.local/bin/ssh_sessions" -show sshc -location 7 -xoffset $x_offset -yoffset $y_offset)

