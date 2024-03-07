#!/bin/bash

# Escanear las redes Wi-Fi disponibles y extraer las direcciones MAC de los puntos de acceso
ap_macs=($(sudo iwlist wlan0 scan | grep "Address:" | awk '{print $5}'))

# Mostrar las direcciones MAC de los puntos de acceso encontrados
echo "Direcciones MAC de los puntos de acceso:"
for mac in "${ap_macs[@]}"; do
    echo "$mac"
done
