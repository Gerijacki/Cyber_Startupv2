#!/bin/bash

# Actualizar paquetes e instalar herramientas básicas
apt update
apt upgrade -y
apt install -y git 
apt install -y wget
apt install -y nmap
apt install -y apache2
apt install -y john
apt install -y hydra
apt install -y tor
apt install -y curl
apt install -y wget
apt install -y gnupg2
apt install -y zip

#Samba
apt install -y samba

# Solicita al usuario el nombre de la carpeta compartida
read -p "Ingresa el nombre de la carpeta compartida: " folder_name

# Solicita al usuario el path de la carpeta que desea compartir
read -p "Ingresa la ruta de la carpeta que deseas compartir (por ejemplo, /ruta/a/carpeta): " folder_path

# Agrega la configuración de la carpeta compartida a smb.conf
mkdir $folder_path
echo "[$folder_name]" >> /etc/samba/smb.conf
echo "   path = $folder_path" >> /etc/samba/smb.conf
echo "   writable = yes" >> /etc/samba/smb.conf
echo "   guest ok = yes" >> /etc/samba/smb.conf
echo "   browseable = yes" >> /etc/samba/smb.conf
echo "   read only = no" >> /etc/samba/smb.conf

# Reinicia el servicio Samba
systemctl restart smbd

# Instalar Apache y configurar

mkdir /var/www/html/imagenes

# Otras herramientas esenciales de ciberseguridad (añade o quita según tus necesidades)

# Metaexploit

# apt install curl gpg autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev libsqlite3-dev libpq-dev libpcap-dev libmagick++-dev libidn11-dev libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev libyaml-dev python3-dev liblzma-dev libtool
# apt install curl ca-certificates apt-transport-https software-properties-common lsb-release postgresql -y
# curl -fsSL https://apt.metasploit.com/metasploit-framework.gpg.key | gpg --dearmor | tee /usr/share/keyrings/metasploit.gpg > /dev/null
# echo "deb [signed-by=/usr/share/keyrings/metasploit.gpg] http://downloads.metasploit.com/data/releases/metasploit-framework/apt buster main" | tee /etc/apt/sources.list.d/metasploit.list
# apt update
# apt install metasploit-framework

# Clonar repositorios interesantes
cd $folder_path
git clone https://github.com/SergiGiribet/google-SignIn
git clone https://github.com/rajkumardusad/IP-Tracer.git
git clone https://github.com/Gerijacki/Mine-Startup
git clone https://github.com/ShadowVMX/Web-Scanner 
git clone https://github.com/jeanphorn/wordlist
git clone https://github.com/screetsec/TheFatRat

# Server web
rm /var/www/html/index.html
cp /$folder_path/Mine-Startup/index.html /var/www/html
cp /$folder_path/Mine-Startup/image1.png /var/www/html
cp /$folder_path/Mine-Startup/image2.png /var/www/html
cp /$folder_path/Mine-Startup/image3.png /var/www/html

# MOTD en debian
echo "/cositas/Mine-Startupv2/motd.sh" >> /etc/profile

echo "Se han instalado todas las herramientas correctamente"
echo "Samba se ha instalado y configurado para compartir la carpeta $folder_name en $folder_path."
