#!/bin/bash

# Verifica si el script se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ejecutarse como root" 
    exit 1
fi

# Actualiza la lista de paquetes
apt-get update

# Instala todas las herramientas de Kali Linux
apt-get install -y kali-linux-full

# Fin del script
echo "Instalación completada. Todas las herramientas de Kali Linux han sido instaladas."
