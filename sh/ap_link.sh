
#!/bin/bash

# Verifica si el script se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ejecutarse como root" 
    exit 1
fi

# Instalar hostapd y dnsmasq
apt-get update
apt-get install -y hostapd dnsmasq

# Configurar hostapd
cat <<EOF > /etc/hostapd/hostapd.conf
interface=wlan0
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

# Configurar dnsmasq
cat <<EOF > /etc/dnsmasq.conf
interface=wlan0
dhcp-range=192.168.1.2,192.168.1.20,255.255.255.0,24h
EOF

# Habilitar IP Forwarding
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p

# Configurar redirección automática
echo "iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE" >> /etc/rc.local
echo "iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT" >> /etc/rc.local
echo "iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT" >> /etc/rc.local
echo "iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.1.1:80" >> /etc/rc.local
chmod +x /etc/rc.local

# Reiniciar servicios
service hostapd restart
service dnsmasq restart

# Mostrar mensaje de finalización
echo "Configuración completada. Tu punto de acceso WiFi está listo con redirección automática."
