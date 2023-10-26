Para crear un punto de acceso WiFi que redireccione a los usuarios a una página web cuando se conectan, necesitarás un dispositivo que funcione como punto de acceso (por ejemplo, una computadora con una tarjeta de red inalámbrica o un enrutador WiFi compatible con firmware personalizado como OpenWRT) y un software que admita la funcionalidad de redirección. A continuación, te proporcionaré una guía general utilizando Linux y un paquete de software llamado `hostapd` para crear el punto de acceso y `dnsmasq` para realizar la redirección.

### Paso 1: Configurar el Punto de Acceso

1. **Instalar `hostapd` y `dnsmasq`**:
   
   ```bash
   sudo apt-get update
   sudo apt-get install hostapd dnsmasq
   ```

2. **Configurar `hostapd`**:

   Crea un archivo de configuración para `hostapd`. Por ejemplo, `hostapd.conf`:

   ```plaintext
   interface=wlan0
   driver=nl80211
   ssid=Nombre_de_tu_Red
   hw_mode=g
   channel=6
   macaddr_acl=0
   auth_algs=1
   ignore_broadcast_ssid=0
   wpa=2
   wpa_passphrase=Tu_Contraseña_WiFi
   wpa_key_mgmt=WPA-PSK
   wpa_pairwise=TKIP
   rsn_pairwise=CCMP
   ```

   Asegúrate de cambiar `Nombre_de_tu_Red` a un nombre adecuado para tu red y `Tu_Contraseña_WiFi` a una contraseña segura.

3. **Configurar `dnsmasq`**:

   Editar el archivo de configuración `dnsmasq.conf`:

   ```plaintext
   address=/#/192.168.1.1
   ```

   Esto asignará la IP `192.168.1.1` a todos los dominios.

### Paso 2: Habilitar el IP Forwarding

Asegúrate de que el forwarding de IP esté habilitado en tu sistema. Abre el archivo `/etc/sysctl.conf` y descomenta la línea `net.ipv4.ip_forward=1`. Luego, ejecuta:

```bash
sudo sysctl -p
```

### Paso 3: Configurar la Redirección

1. **Configurar un Servidor Web Simple**:
   Puedes usar herramientas como Python o Node.js para crear un servidor web simple que sirva la página de redirección. Por ejemplo, con Python:

   ```bash
   python3 -m http.server 80
   ```

2. **Configurar la Redirección en `dnsmasq`**:
   En el archivo `dnsmasq.conf`, agrega la siguiente línea para redirigir todas las solicitudes a tu servidor web:

   ```plaintext
   address=/#/IP_de_Tu_Servidor_Web
   ```

   Asegúrate de cambiar `IP_de_Tu_Servidor_Web` a la dirección IP de tu servidor web.

### Paso 4: Iniciar el Punto de Acceso

Inicia `hostapd` y `dnsmasq`:

```bash
sudo hostapd /ruta/a/tu/hostapd.conf
sudo dnsmasq -C /ruta/a/tu/dnsmasq.conf
```

Con estos pasos, tu sistema debería funcionar como un punto de acceso WiFi que redirige a los usuarios a una página web específica cuando intentan navegar por Internet. Ten en cuenta que estos pasos son básicos y pueden requerir ajustes según tus necesidades específicas y el entorno en el que estés trabajando. Además, asegúrate de cumplir con las leyes y regulaciones locales relacionadas con la creación de puntos de acceso WiFi públicos.