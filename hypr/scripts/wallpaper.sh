#!/bin/bash

# wallpaper folder
DIR=$HOME/Pictures/walls

PICS=($DIR/*)
RANDOM_PIC=${PICS[$RANDOM % ${#PICS[@]}]}

swww img "$RANDOM_PIC" --transition-type center --transition-fps 60

sleep 2

notify-send "Wallpaper" "The wallpaper has been changed! :)" 
