# README.md

## Descripción

Este script Bash automatiza la instalación de herramientas y configuraciones básicas en un sistema Debian. Instala y actualiza paquetes, herramientas de ciberseguridad, servicios como Apache y Samba, y clona varios repositorios útiles para pruebas y análisis.

## Requisitos

- Sistema operativo: Debian
- Acceso de superusuario (sudo)

## Instrucciones de Uso

1. **Ejecutar el Script:**
   ```bash
   chmod +x script.sh
   ./script.sh
   ```

2. **Configuración de Samba:**
   - El script solicitará la ruta de la carpeta que deseas compartir.
   - Samba se configura automáticamente para compartir la carpeta especificada.

3. **Ejecución de bspwm:**
   ```bash
   ./setup.sh
   ```
   **Nota:** Asegúrate de ejecutar este paso después de la instalación para activar bspwm.

## Herramientas Instaladas

- Git, wget, nmap, Apache2, John the Ripper, Hydra, Tor, cURL, GNUPG, Zip, Neofetch, Python, Python2, Python3, pip, Aircrack-ng, Hostapd, Tcpdump, Dnsmasq, Htop, Samba, y otras herramientas esenciales de ciberseguridad.

## Repositorios Clonados

- [Google SignIn](https://github.com/SergiGiribet/google-SignIn)
- [IP Tracer](https://github.com/rajkumardusad/IP-Tracer.git)
- [Mine Startup](https://github.com/Gerijacki/Mine-Startup)
- [Web Scanner](https://github.com/ShadowVMX/Web-Scanner)
- [Wordlist](https://github.com/jeanphorn/wordlist)
- [TheFatRat](https://github.com/screetsec/TheFatRat)
- [Telegram Get Remote IP](https://github.com/n0a/telegram-get-remote-ip)
- [Sherlock](https://github.com/sherlock-project/sherlock.git)
- [Hackingtool](https://github.com/Z4nzu/hackingtool.git)
- [SETSMS](https://github.com/Darkmux/SETSMS)
- [AnonGT](https://github.com/gt0day/AnonGT)

## Notas Adicionales

- Se ha creado un enlace simbólico para el archivo `/etc/shadow` llamado `contrasenas`.
- Al finalizar la instalación, se mostrará un mensaje indicando que falta ejecutar bspwm y que todas las herramientas se han instalado correctamente.

¡Disfruta explorando y utilizando estas herramientas!