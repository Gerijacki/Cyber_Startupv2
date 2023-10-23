#!/bin/bash

# Verificar si el usuario tiene privilegios de superusuario
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como superusuario (root)." 
   exit 1
fi

# Nombre de la interfaz WiFi
read -p "Ingresa el nombre de la interfaz wifi: " interfaz

    # interfaz="wlan0"

# Detener el servicio de red para evitar conflictos
service networking stop

# Cargar el controlador necesario (Asegúrate de tener el controlador adecuado instalado)
modprobe ath9k_htc

# Configurar la interfaz en modo monitor
iw dev $interfaz interface add mon0 type monitor
ifconfig mon0 up

echo "El adaptador WiFi $interfaz ha sido configurado en modo monitor (mon0)."
