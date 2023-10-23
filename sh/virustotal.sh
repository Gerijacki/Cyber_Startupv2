#!/bin/bash

# Verifica si el script se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ejecutarse como root" 
    exit 1
fi

# Ruta a la carpeta que quieres verificar
CARPETA="/ruta/a/tu/carpeta"

# Clave de API de VirusTotal (reemplázala con tu propia clave)
API_KEY="TU_CLAVE_DE_API"

# Verifica cada archivo en la carpeta
for archivo in "$CARPETA"/*; do
    echo "Verificando archivo: $archivo"
    # Calcula el hash SHA256 del archivo
    hash=$(sha256sum "$archivo" | awk '{ print $1 }')

    # Realiza la consulta a la API de VirusTotal
    respuesta=$(curl -s --request GET \
      --url "https://www.virustotal.com/api/v3/files/$hash" \
      --header "x-apikey: $API_KEY")

    # Imprime la respuesta de VirusTotal
    echo "$respuesta"
    echo "-------------------------------------"
done

# Fin del script
