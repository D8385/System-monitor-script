#!/bin/bash

RAM=$(free | awk '/Mem/ {printf("%.2f"), $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "RAM Usage: $RAM%" 
echo "Disk Usage: $DISK%"

if (( $(echo "$RAM > 10" | bc -l) )) || [ "$DISK" -gt 10 ]; then
    echo "ALERT: High Usage - RAM: $RAM%, Disk: $DISK%" >> /mnt/c/Users/Dharmik\ Gohil/alert.log
fi
