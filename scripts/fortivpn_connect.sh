#!/bin/bash

connect_to_vpn() {
    forticlient vpn connect AND -wa
    read -rp "exit"
}

connect_to_vpn
