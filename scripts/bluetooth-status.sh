#!/bin/sh
# Get Bluetooth status
status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

if [ "$status" = "yes" ]; then
    echo "%{F#00FF00}󰂯%{F-}" # Green icon for enabled
else
    echo "%{F#FF0000}󰂲%{F-}" # Red icon for disabled
fi
