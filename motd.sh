#!/bin/bash

# Obtener información del sistema
HOSTNAME=$(hostname)
KERNEL=$(uname -r)
UPTIME=$(uptime -p)
MEMORY=$(free -h | awk '/Mem/{print $2}')
DISK=$(df -h / | awk '/\//{print $4}')
USERS=$(who -q | grep -oP '\d+')
IP=$(hostname -I | awk '{print $1}')

# Limpiar el archivo de mensaje del día
> /etc/motd

# Escribir el mensaje del día
echo "Bienvenido a $HOSTNAME"
echo "Sistema Operativo: Debian"
echo "Kernel: $KERNEL"
echo "Usuarios Conectados: $USERS"
echo "Uptime: $UPTIME"
echo "Memoria Disponible: $MEMORY"
echo "Espacio en Disco Disponible: $DISK"
echo "Dirección IP: $IP"

# Para que el script se ejecute automáticamente al iniciar sesión con cualquier usuario en Debian, 
# puedes agregar la ruta del script al archivo /etc/profile
# Agrega la ruta del script al final del archivo:

# Agrega la línea al final del archivo para ejecutar tu script:

# "/ruta/al/tu/script/motd.sh"