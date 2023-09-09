# Descripción del Script Mine-Startupv2

Este script de Bash tiene como objetivo automatizar la instalación y configuración de una serie de herramientas y servicios en un sistema Debian. Las acciones realizadas por el script se detallan a continuación:

---

## Actualización de paquetes e instalación de herramientas básicas
- Se actualiza la lista de paquetes y se instalan las siguientes herramientas básicas:
  - `git`: Sistema de control de versiones.
  - `wget`: Utilidad para la descarga de archivos desde la línea de comandos.
  - `nmap`: Herramienta de escaneo de redes y detección de servicios.
  - `apache2`: Servidor web Apache.
  - `john`: Herramienta de recuperación de contraseñas.
  - `hydra`: Herramienta de prueba de penetración para ataques de fuerza bruta.
  - `tor`: Cliente de red anónima.
  - `curl`: Herramienta para transferencias de datos con URL.
  - `gnupg2`: Herramienta de cifrado y autenticación.

---

## Configuración de Samba
- Se instala el servicio Samba para habilitar el uso compartido de archivos en red.
- El usuario es solicitado para proporcionar el nombre de la carpeta compartida y la ruta de la carpeta que desea compartir.
- Se agrega la configuración de la carpeta compartida al archivo `/etc/samba/smb.conf`.
- Se reinicia el servicio Samba para aplicar los cambios.

---

## Configuración de Apache
- Se crea un directorio `/var/www/html/imagenes` en el servidor web Apache.

---

## Otras herramientas esenciales de ciberseguridad
- Se instala Metaexploit junto con una serie de dependencias necesarias.
- Se configura el repositorio Metasploit y se instala el marco de msfvenom.

---

## Clonación de repositorios interesantes
- Se clonan varios repositorios de GitHub en la ubicación especificada por el usuario.

---

## Configuración del servidor web
- Se elimina el archivo `index.html` predeterminado en el servidor web Apache.
- Se copian archivos HTML y recursos de un repositorio clonado en el directorio `/var/www/html` para servir como página web.

---

## Mensajes de confirmación
- Se muestran mensajes que indican que todas las herramientas se han instalado correctamente y que Samba se ha configurado para compartir la carpeta especificada.

---

**Nota**: Este script asume que se está ejecutando en un sistema Debian y puede requerir privilegios de superusuario para instalar y configurar algunos paquetes y servicios.

## Uso
1. Copia el script en tu sistema Debian.
2. Ejecuta el script utilizando `bash` u otro intérprete de comandos.

Ten en cuenta que el script realiza cambios significativos en la configuración de tu sistema y la instalación de software, por lo que debes comprender y revisar cuidadosamente el código antes de ejecutarlo.

---

## DISCLAIMER

El software de phishing és una eina que simula pàgines web legítimes per obtenir informació personal dels usuaris. Malgrat això, els creadors afirmen que la seva intenció no és perjudicar els usuaris, sinó per demostrar la vulnerabilitat de les pàgines web i promoure la seguretat informàtica.
El projecte ha estat desenvolupat amb l'objectiu de proporcionar als estudiants i als professionals de la seguretat informàtica una eina per comprendre les vulnerabilitats dels sistemes informàtics i les tècniques que poden utilitzar els hackers per accedir a informació confidencial.
No ens fem responsables del posibles usos inadequats que se li puguin donar a aquesta eina.

![Rickroll](./media/roll.gif)

---

