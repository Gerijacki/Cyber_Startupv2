#!/bin/bash

# Nombre del archivo de captura
read -p "Ingresa el nombre del archivo final: " archivo_captura

    # archivo_captura="captura_http_requests.pcap"

# Interfaz en modo monitor

read -p "Ingresa el nombre de la interfaz: " interfaz

    # interfaz="mon0"

# Capturar peticiones GET y POST y guardarlas en un archivo
sudo tcpdump -i $interfaz -w $archivo_captura '((port 80 or port 443) and (tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420 or tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x504f5354))'

echo "Captura completada. Los datos se han guardado en $archivo_captura."
