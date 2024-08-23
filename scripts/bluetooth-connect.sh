#!/bin/bash

# Function to scan for new devices
scan_devices() {
    echo "Scanning for Bluetooth devices..."
    # Use a here-document to send commands to bluetoothctl
    bluetoothctl <<EOF
power on
scan on
EOF
    # sleep 5 # Scan for 5 seconds
    # bluetoothctl scan off
}

# Function to list available devices
list_devices() {
    echo "Available Bluetooth Devices:"
    # List all devices and format the output
    bluetoothctl devices | awk '{for(i=3;i<=NF;i++) printf $i " "; print ""}' | nl
}

# Function to connect to a device
connect_device() {
    local device_mac="$1"
    if bluetoothctl info "$device_mac" | grep -q "Connected: yes"; then
        echo "Already connected to $device_mac. Disconnecting..."
        bluetoothctl disconnect "$device_mac"
    else
        echo "Connecting to $device_mac..."
        bluetoothctl connect "$device_mac"
    fi
}

# Scan for new devices
scan_devices

# List devices
list_devices

# Check if any devices were found
if ! bluetoothctl devices | grep -q "Device"; then
    echo "No Bluetooth devices found. Please ensure your device is discoverable."
    exit 1
fi

# Prompt user for device selection
echo "Enter the number of the device to connect: "
read -r device_number

# Get the MAC address of the selected device
device_mac=$(bluetoothctl devices | awk -v num="$device_number" 'NR==num {print $2}')

if [ -n "$device_mac" ]; then
    connect_device "$device_mac"
else
    echo "Invalid selection."
fi
