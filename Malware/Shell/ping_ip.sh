#!/bin/bash

# Obteniendo la dirección IP del host que quieres pinguear
read -p "Introduce la dirección IP del host: " ip_address

# Realizando un ping y obteniendo el TTL
ttl=$(ping -c 1 -w 1 $ip_address | grep "ttl" | awk '{print $6}' | awk -F= '{print $2}')

if [ $ttl -eq 64 ]; then
    echo "El sistema operatiu és Linux."
elif [ $ttl -eq 128 ]; then
    echo "El sistema operatiu és Windows."
elif [ $ttl -eq 255 ]; then
    echo "El sistema operatiu és Solaris."
else
    echo "No s'ha pogut identificar el sistema operatiu."
fi

# Comprobando si el host es accesible basándose en el TTL
if [ -n "$ttl" ]; then
    echo "El host es accesible (TTL: $ttl)."

    # Intentando identificar el sistema operativo utilizando nmap
    echo "Intentando identificar el sistema operativo..."
    output=$(nmap -sV $ip_address)
    echo "$output"
else
    echo "El host no es accesible."
fi
