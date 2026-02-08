#!/usr/bin/env sh

# Kill any running waybar first
killall -q waybar

while pgrep -x waybar >/dev/null; do sleep 1; done

# Start Waybar with your config & style
waybar -c "$HOME/.config/waybar/config" -s "$HOME/.config/waybar/style.css" &
