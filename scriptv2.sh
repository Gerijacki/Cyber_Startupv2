#!/bin/bash
apt install -y dialog
# Función para mostrar la barra de carga
show_progress() {
    dialog --title "Progreso" --gauge "Realizando tareas..." 10 70 < <(
        # Simula tareas y actualiza la barra de carga
        for i in {1..10}; do
            echo $((i * 10))
            sleep 1
        done
    )
}

# Función para manejar errores
handle_error() {
    dialog --title "Error" --msgbox "Ha ocurrido un error. Verifique el registro para más detalles." 10 70
    exit 1
}

# Función para ejecutar comandos y manejar errores
execute_command() {
    $1
    if [ $? -ne 0 ]; then
        handle_error
    fi
}

# Actualizar paquetes e instalar herramientas básicas
show_progress
execute_command "apt update"
execute_command "apt upgrade -y"
execute_command "apt install -y wget"
execute_command "apt install -y git"
execute_command "apt install -y nmap"
execute_command "apt install -y apache2" 
execute_command "apt install -y john"
execute_command "apt install -y hydra"
execute_command "apt install -y tor"
execute_command "apt install -y curl"
execute_command "apt install -y gnupg2"
execute_command "apt install -y samba"

# Solicitar al usuario el nombre de la carpeta compartida
folder_name=""
while [ -z "$folder_name" ]; do
    folder_name=$(dialog --inputbox "Ingresa el nombre de la carpeta compartida:" 10 70 3>&1 1>&2 2>&3)
done

# Solicitar al usuario la ruta de la carpeta que desea compartir
folder_path=""
while [ -z "$folder_path" ]; do
    folder_path=$(dialog --inputbox "Ingresa la ruta de la carpeta que deseas compartir (por ejemplo, /ruta/a/carpeta):" 10 70 3>&1 1>&2 2>&3)
done

# Agregar la configuración de la carpeta compartida a smb.conf
execute_command "mkdir $folder_path"
echo "[$folder_name]" >> /etc/samba/smb.conf
echo "   path = $folder_path" >> /etc/samba/smb.conf
echo "   writable = yes" >> /etc/samba/smb.conf
echo "   guest ok = yes" >> /etc/samba/smb.conf
echo "   browseable = yes" >> /etc/samba/smb.conf
echo "   read only = no" >> /etc/samba/smb.conf

# Reiniciar el servicio Samba
execute_command "systemctl restart smbd"

# Instalar Apache y configurar
execute_command "mkdir /var/www/html/imagenes"

# Otras herramientas esenciales de ciberseguridad
execute_command "apt install curl gpg autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev libsqlite3-dev libpq-dev libpcap-dev libmagick++-dev libidn11-dev libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev libyaml-dev python3-dev liblzma-dev libtool -y"
execute_command "apt install curl ca-certificates apt-transport-https software-properties-common lsb-release postgresql -y"
execute_command "curl -fsSL https://apt.metasploit.com/metasploit-framework.gpg.key | sudo gpg --dearmor | sudo tee /usr/share/keyrings/metasploit.gpg > /dev/null"
execute_command "echo 'deb [signed-by=/usr/share/keyrings/metasploit.gpg] http://downloads.metasploit.com/data/releases/metasploit-framework/apt buster main' | sudo tee /etc/apt/sources.list.d/metasploit.list"
execute_command "apt update"
execute_command "apt install metasploit-framework -y"

# Clonar repositorios interesantes
execute_command "cd $folder_path"
execute_command "git clone https://github.com/SergiGiribet/google-SignIn"
execute_command "git clone https://github.com/rajkumardusad/IP-Tracer.git"
execute_command "git clone https://github.com/Gerijacki/Mine-Startup"
execute_command "git clone https://github.com/ShadowVMX/Web-Scanner"


# Servidor web
execute_command "rm /var/www/html/index.html"
execute_command "cp $folder_path/Mine-Startup/index.html /var/www/html"
execute_command "cp $folder_path/Mine-Startup/image1.png /var/www/html"
execute_command "cp $folder_path/Mine-Startup/image2.png /var/www/html"
execute_command "cp $folder_path/Mine-Startup/image3.png /var/www/html"

# Mensajes de éxito
dialog --title "Éxito" --msgbox "Se han instalado todas las herramientas correctamente. Samba se ha instalado y configurado para compartir la carpeta $folder_name en $folder_path." 10 70

exit 0
