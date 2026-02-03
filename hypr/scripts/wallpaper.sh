#!/bin/bash

# Configuration
DIR="$HOME/Pictures/walls"
TRANSITION_ARGS="--transition-type center --transition-fps 60"

# 1. Get a list of all images
PICS=("$DIR"/*)

CURRENT_WALL=$(swww query | grep -oP '(?<=image: ).*')

# 3. Pick a random one, but don't pick the same one
while true; do
    RANDOM_PIC="${PICS[$RANDOM % ${#PICS[@]}]}"
    if [ "$RANDOM_PIC" != "$CURRENT_WALL" ]; then
        break
    fi
done

swww img "$RANDOM_PIC" $TRANSITION_ARGS

notify-send -i "preferences-desktop-wallpaper" "Wallpaper Changed" "Enjoy your new view! :)"
