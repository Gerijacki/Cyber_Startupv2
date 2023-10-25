#!/bin/bash

# Obtener la dirección de la subred (por ejemplo, 192.168.1)
read -p "Introduce la dirección de la subred (por ejemplo, 192.168.1): " subnet

# Escanear la red con nmap y obtener información detallada de los dispositivos
nmap -sn "$subnet.0/24" -oG - | awk '/Up$/{print $2}' | while read -r ip; do
    echo "--------------------------------------------------------------------"
    echo "Información para el dispositivo en la dirección IP: $ip"
    echo "--------------------------------------------------------------------"
    
    # Obtener detalles adicionales del dispositivo usando nmap
    nmap -A -T4 "$ip"
    
    # Puedes agregar más comandos nmap según la información que necesites
    # nmap -sV "$ip" para obtener información de versiones de servicios
    # nmap -p- "$ip" para escanear todos los puertos del dispositivo
    
    echo "--------------------------------------------------------------------"
    echo ""
done
