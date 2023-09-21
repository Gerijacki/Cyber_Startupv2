#!/bin/bash

subnet="192.168.0"

for host in {1 .. 254}; do
    ip="${subnet}.${host}"
    if ping -c 1 "$ip" > /dev/null 2>&1; then
        echo "Host activo: $ip"
    fi
done