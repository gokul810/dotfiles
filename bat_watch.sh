#!/bin/bash
# Place it inside ~/.local/bin/

# Configuration
LOW=20
CRITICAL=10
BAT="BAT0"

while true; do
    if [ -d "/sys/class/power_supply/$BAT" ]; then
        CAP=$(cat /sys/class/power_supply/$BAT/capacity)
        STAT=$(cat /sys/class/power_supply/$BAT/status)

        if [ "$STAT" = "Discharging" ]; then
            if [ "$CAP" -le "$CRITICAL" ]; then
                # Flag -u critical triggers the RED border in dunstrc
                notify-send "Battery Critical!" \
                    "System will shut down soon if not plugged in! ($CAP%)" \
                    -i battery-level-10-symbolic \
                    -u critical
                sleep 180 
            elif [ "$CAP" -le "$LOW" ]; then
                # Flag -u normal triggers the standard border
                notify-send "Battery Low" \
                    "Please connect your charger. ($CAP%)" \
                    -i battery-level-20-symbolic \
                    -u normal
                sleep 600
            fi
        fi
    fi
    sleep 120
done
