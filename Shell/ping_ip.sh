#!/bin/bash

# Obteniendo la dirección IP del host que quieres pinguear
read -p "Introduce la dirección IP del host: " ip_address

# Realizando un ping y obteniendo el TTL
ttl=$(ping -c 1 -w 1 $ip_address | grep "ttl" | awk '{print $6}' | awk -F= '{print $2}')

# Comprobando si el host es accesible basándose en el TTL
if [ -n "$ttl" ]; then
    echo "El host es accesible (TTL: $ttl)."

    # Intentando identificar el sistema operativo utilizando nmap
    echo "Intentando identificar el sistema operativo..."
    os_info=$(sudo nmap -O $ip_address | grep "OS details" | awk -F: '{print $2}')

    if [ -n "$os_info" ]; then
        echo "Sistema operativo: $os_info"
    else
        echo "No se pudo determinar el sistema operativo."
    fi
else
    echo "El host no es accesible."
fi