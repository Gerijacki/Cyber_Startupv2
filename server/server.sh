# Verifica si el script se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ejecutarse como root" 
    exit 1
fi

# Actualiza la lista de paquetes
apt update -y
apt upgrade -y 
apt install -y ftp  
apt install -y ssh
apt install -y openssh-server
systemctl enable ssh
apt install -y cockpit 
apt install -y samba
systemctl enable smb
apt install -y ntfy
apt install -y snap
snap install core
apt install -y tor
apt install -y git
apt install -y docker.io
systemctl enable docker.io
apt install -y onionshare
systemctl start onionshare
#Pi Hole
docker run -d --name pihole -e ServerIP=192.168.31.111 -e TZ=Europe/Madrid -e WEBPASSWORD=1234 -p 53:53/tcp -p 53:53/udp -p 80:80 -p 443:443 --restart=unless-stopped pihole/pihole:latest
#Docker ntfy

# Crear el archivo de configuración server.yml en /etc/ntfy/
# sudo mkdir -p /etc/ntfy
echo "base-url: http://192.168.31.111" | sudo tee /etc/ntfy/server.yml
echo "upstream-base-url: "https://ntfy.sh"" | sudo tee -a /etc/ntfy/server.yml

# Iniciar el servidor de Docker con ntfy
sudo docker run \
    -v /var/cache/ntfy:/var/cache/ntfy \
    -v /etc/ntfy:/etc/ntfy \
    -p 80:80 \
    -itd \
    binwiederhier/ntfy \
    serve \
    --cache-file /var/cache/ntfy/cache.db

echo "ntfy se ha instalado y configurado correctamente mediante Docker."
break

# Instala Apache y PHP junto con algunas extensiones comunes
apt install -y apache2 php libapache2-mod-php php-mysql

# Reinicia el servicio de Apache para aplicar los cambios
systemctl restart apache2

# Verifica el estado del servicio de Apache
if systemctl is-active --quiet apache2; then
    echo "Servidor Apache y PHP han sido instalados y configurados correctamente."
else
    echo "Hubo un problema al instalar Apache y PHP. Por favor, verifica el sistema e intenta nuevamente."
fi

# web ip:9090
curl -d "Configuració Acabada" 192.168.31.111/server