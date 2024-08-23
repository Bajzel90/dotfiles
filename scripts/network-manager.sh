#!/bin/bash

# Network Manager Script

COLOR_SSID="%{F#00FF00}"         # Green for SSID
COLOR_IP="%{F#8069FF}"           # Blue for IP address
COLOR_DISCONNECTED="%{F#FF0000}" # Red for disconnected message
COLOR_RESET="%{F-}"              # Reset to default

list_available_wifi() {
    # List available Wi-Fi networks and use fzf to select one
    _ssid=$(nmcli -t -f ssid dev wifi | sort | uniq | fzf --height 40% --reverse --header "Select a Wi-Fi network:")

    if [ -n "$_ssid" ]; then
        connect_to_wifi "$_ssid"
    else
        exit 0
    fi
}

connect_to_wifi() {
    _ssid="$1"
    echo "Connecting to $_ssid..."
    nmcli device wifi connect "$_ssid"
}

get_current_wifi_info() {
    # Get the current connected Wi-Fi SSID and IP address
    _ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
    _ip_address=$(ip addr show wlan0 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1) # Adjust 'wlan0' if your interface name is different

    if [ -n "$_ssid" ]; then
        printf "%b %b\n" "${COLOR_SSID}${_ssid}${COLOR_RESET}" "${COLOR_IP}${_ip_address}${COLOR_RESET}" # Added colors for connected
    else
        printf "%b\n" "${COLOR_DISCONNECTED}Not connected${COLOR_RESET}" # Added red color for disconnected
    fi
}

# Check the command-line argument
if [ "$1" = "info" ]; then
    get_current_wifi_info
else
    list_available_wifi
fi
