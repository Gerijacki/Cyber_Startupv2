#!/bin/bash

# Verifica si el script se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ejecutarse como root" 
    exit 1
fi

# Actualiza la lista de paquetes
apt-get update

# Instala Apache y PHP junto con algunas extensiones comunes
apt-get install -y apache2 php libapache2-mod-php php-mysql

# Reinicia el servicio de Apache para aplicar los cambios
systemctl restart apache2

# Verifica el estado del servicio de Apache
if systemctl is-active --quiet apache2; then
    echo "Servidor Apache y PHP han sido instalados y configurados correctamente."
else
    echo "Hubo un problema al instalar Apache y PHP. Por favor, verifica el sistema e intenta nuevamente."
fi

# Fin del script
