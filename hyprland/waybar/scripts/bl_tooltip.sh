#!/usr/bin/env bash

device_name=$(bluetoothctl info | grep "Name" | cut -d ' ' -f2- || echo "N/A")
state=$(bluetoothctl info | grep "Connected" | awk '{print $2}' || echo "Disconnected")
battery_hex=$(bluetoothctl info | grep "Battery Percentage" | awk '{print $3}')
battery=$((battery_hex))  # converts hex to decimal, if needed
battery=${battery:-N/A}

echo -e "Device: $device_name\nStatus: $state\nBattery: ${battery}%"

