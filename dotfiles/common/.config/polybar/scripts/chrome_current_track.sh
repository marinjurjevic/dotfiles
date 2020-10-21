#!/bin/sh

PLAYERCTL_GENERAL_ERROR="No player could handle this command"

players=($(playerctl -l))

for p in ${players[@]}
do
    status="$(playerctl -p $p status)"
    if [[ $status == "Paused" ]]; then
        output_str="$output_str   "
    elif [[ $status == "Playing" ]]; then
        output_str="$output_str   "
    else
        continue
    fi


    artist="$(playerctl -p $p metadata artist)"
    title="$(playerctl -p $p metadata title)"
    
    # chrome
    if [[ $p == *"chrome"* ]]; then
        output_str="$output_str   "
        output_str="$output_str ${title:0:20}"
    fi

    # spotify
    if [[ $p == "spotify" ]]; then
        output_str="$output_str   "
        output_str="$output_str $artist - $title" 
    fi
done

echo $output_str
