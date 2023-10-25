#!/bin/bash

# Verifica si el script se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ejecutarse como root" 
    exit 1
fi

# Configuración de interfaces y direcciones IP
WLAN_INTERFACE="wlan0"
ETH_INTERFACE="eth0"
WLAN_IP="192.168.31.148"
ETH_IP="192.168.31.111"

# Configurar hostapd para el punto de acceso WiFi
cat <<EOF > /etc/hostapd/hostapd.conf
interface=$WLAN_INTERFACE
driver=nl80211
ssid=MiRed
hw_mode=g
channel=6
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=MiContraseña
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
EOF

# Configurar dnsmasq para DHCP y DNS
cat <<EOF > /etc/dnsmasq.conf
interface=$WLAN_INTERFACE
dhcp-range=192.168.31.2,192.168.31.20,255.255.255.0,24h
EOF

# Habilitar IP Forwarding
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p

# Configurar redirección automática
iptables -t nat -A POSTROUTING -o $ETH_INTERFACE -j MASQUERADE
iptables -A FORWARD -i $ETH_INTERFACE -o $WLAN_INTERFACE -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $WLAN_INTERFACE -o $ETH_INTERFACE -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination $WLAN_IP:80

# Reiniciar servicios
service hostapd restart
service dnsmasq restart

# Mostrar mensaje de finalización
echo "Configuración completada. Tu punto de acceso WiFi está listo con redirección automática."

