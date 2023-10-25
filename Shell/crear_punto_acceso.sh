#!/bin/bash

# Nombre de la interfaz WiFi
read -p "Ingresa el nombre de la interfaz wifi: " interfaz

    # interfaz="wlan0"

# Nombre del punto de acceso WiFi
read -p "Ingresa el nombre de la wifi: " nombre_ap

    # nombre_ap="MiRedWiFi"

# Contraseña del punto de acceso

read -p "Ingresa la contrasenya: " password

    # password="MiPasswordWiFi"

# Detener el servicio de red
service networking stop

# Configurar la interfaz como punto de acceso
ip link set dev $interfaz down
ip addr flush dev $interfaz
ip link set dev $interfaz up
ip addr add 192.168.1.1/24 dev $interfaz

# Configurar `hostapd`
cat << EOF > /etc/hostapd/hostapd.conf
interface=$interfaz
driver=nl80211
ssid=$nombre_ap
hw_mode=g
channel=6
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=$password
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
EOF

# Iniciar `hostapd`
hostapd /etc/hostapd/hostapd.conf

# Habilitar enrutamiento IP
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

echo "Punto de acceso WiFi ($nombre_ap) creado en la interfaz $interfaz con la contraseña $password."
