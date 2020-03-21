#!/bin/sh

track="$(playerctl metadata | grep title | tr -s ' ' | cut -f 3- -d ' ')"
if [ -z "$track" ]; then
  echo ""
else
  echo "$track"
fi

