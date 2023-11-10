#!/bin/bash

# Verifica si el script se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ejecutarse como root" 
    exit 1
fi

# Actualiza la lista de paquetes
apt update -y
apt upgrade -y 

# Instala software básico
apt install -y ftp  
apt install -y ssh
apt install -y openssh-server
systemctl enable ssh

# Instala y habilita Samba
apt install -y samba
systemctl enable smb

# Instala Snap y Core
apt install -y snap
snap install core

# Instala Tor
apt install -y tor

# Instala Git
apt install -y git

# Instala Docker y habilita el servicio
apt install -y docker.io
systemctl enable docker.io

# Instala OnionShare y lo inicia
apt install -y onionshare
systemctl start onionshare

# Instala Portainer y realiza configuración inicial
apt install -y portainer
docker volume create portainer_data
docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

# Ejecuta OWASP ZAP en un contenedor Docker
docker run -u zap -p 8080:8080 -p 8090:8090 -i owasp/zap2docker-stable zap-webswing.sh

# Ejecuta un servidor de Minecraft en Docker
docker run -d -p 25565:25565 --name minecraft-server itzg/minecraft-server

# Abre puertos en el firewall (ufw)
ufw allow 22          # SSH
ufw allow 137/udp     # Samba
ufw allow 138/udp     # Samba
ufw allow 139         # Samba
ufw allow 445         # Samba
ufw allow 2375/tcp    # Docker API (opcional, ten en cuenta las implicaciones de seguridad)
ufw allow 17600/tcp   # OnionShare
ufw allow 9000/tcp    # Portainer
ufw allow 8080/tcp    # OWASP ZAP
ufw allow 8090/tcp    # OWASP ZAP
ufw allow 25565/tcp   # Minecraft Server

# Habilita ufw
ufw --force enable

# Configura mensaje del día (MOTD)
chmod +x ../Shell/motd.sh
cp ../Shell/motd.sh /
echo "/motd.sh" >> /etc/profile

# Mensaje de finalización
echo "Configuración Acabada"
echo -e "\e[31mConfiguración Acabada\e[0m"