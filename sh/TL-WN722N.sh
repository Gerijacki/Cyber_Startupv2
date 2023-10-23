#!/bin/bash

# Verifica si el script se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ejecutarse como root" 
    exit 1
fi

# Descargar e instalar los controladores para TL-WN722N
apt-get update
apt-get install -y wireless-tools
apt-get install -y wpasupplicant
apt-get install -y firmware-atheros

# Instala los paquetes necesarios para controladores inalámbricos
apt-get install -y firmware-linux firmware-realtek firmware-atheros firmware-iwlwifi

# Nombre de la interfaz de red inalámbrica (puede variar, verifica con ifconfig o iwconfig)
WLAN_INTERFACE="wlan0"

# SSID y contraseña de tu red Wi-Fi
SSID="Tu_SSID"
PASSWORD="Tu_Contraseña"

# Configura la interfaz inalámbrica
ip link set dev $WLAN_INTERFACE down
ip link set dev $WLAN_INTERFACE up

# Conéctate a la red Wi-Fi
wpa_passphrase "$SSID" "$PASSWORD" >> /etc/wpa_supplicant/wpa_supplicant.conf
wpa_supplicant -B -i $WLAN_INTERFACE -c /etc/wpa_supplicant/wpa_supplicant.conf

# Obtén una dirección IP a través de DHCP
dhclient $WLAN_INTERFACE

# Muestra información sobre la conexión
echo "Configuración de red completada. Tu interfaz inalámbrica $WLAN_INTERFACE está conectada a la red $SSID."

# Fin del script
