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
echo -e "\e[31mBienvenido a $HOSTNAME\e[0m"
echo -e "\e[31mSistema Operativo: Debian\e[0m"
echo -e "\e[31mKernel: $KERNEL\e[0m"
echo -e "\e[31mUsuarios Conectados: $USERS\e[0m"
echo -e "\e[31mUptime: $UPTIME\e[0m"
echo -e "\e[31mMemoria Disponible: $MEMORY\e[0m"
echo -e "\e[31mEspacio en Disco Disponible: $DISK\e[0m"
echo -e "\e[31mDirección IP: $IP\e[0m"


# Para que el script se ejecute automáticamente al iniciar sesión con cualquier usuario en Debian, 
# puedes agregar la ruta del script al archivo /etc/profile
# Agrega la ruta del script al final del archivo:

# Agrega la línea al final del archivo para ejecutar tu script:

# "/ruta/al/tu/script/motd.sh"