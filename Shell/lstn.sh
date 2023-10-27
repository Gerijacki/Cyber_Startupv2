#!/bin/bash

# Capturar tráfico de red en el puerto Ethernet específico (por ejemplo, eth0)
tcpdump -i eth0 -w captured_traffic.pcap

# Filtrar el tráfico para obtener solo las imágenes y guardar los detalles en un archivo log
tcpdump -r captured_traffic.pcap -n -A | grep -E -o "GET /[^ ]+" | awk '{print $2}' > captured_files.log

# Descargar archivos al directorio "downloads"
mkdir -p downloads
cat captured_files.log | while read -r line; do
    wget -P downloads "$line"
done

# Limpiar archivos temporales
rm captured_traffic.pcap captured_files.log