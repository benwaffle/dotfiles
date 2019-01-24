#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

function get_song {
    STR="$(playerctl metadata artist) - $(playerctl metadata title)"
    if [ ${#STR} -gt 35 ]; then
        echo ${STR::35}…
    else
        echo $STR
    fi
}

# , , 
if [ "$player_status" = "Playing" ]; then
    echo -n " "
    get_song
elif [ "$player_status" = "Paused" ]; then
    echo -n " "
    get_song
else
    echo "error"
fi
