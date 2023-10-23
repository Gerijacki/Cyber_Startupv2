#!/bin/bash

# Pedir al usuario el nombre de la interfaz de red y el nombre de la red WiFi
read -p "Introduce el nombre de la interfaz de red (por ejemplo, wlan0): " interfaz
read -p "Introduce el nombre de la red WiFi: " nombre_red

# Pedir la contraseña de la red WiFi de forma segura
read -s -p "Introduce la contraseña de la red WiFi: " password
echo

# Crear el archivo de configuración para la red WiFi
cat << EOF > /etc/network/interfaces.d/wlan0
auto $interfaz
iface $interfaz inet dhcp
    wpa-ssid "$nombre_red"
    wpa-psk "$password"
EOF

# Reiniciar el servicio de red para aplicar los cambios
service networking restart

echo "Configuración de red WiFi completada para la interfaz $interfaz."
