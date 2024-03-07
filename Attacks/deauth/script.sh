#!/bin/bash

# Funció per mostrar el menú
mostrar_menu() {
    clear
    echo "********************************************************"
    echo "Benvingut al programa d'administració de xarxes"
    echo "********************************************************"
    echo "Selecciona una opció:"
    echo "1. Posar la interfície en mode monitor"
    echo "2. Desactivar el mode monitor"
    echo "3. Escanejar xarxes WiFi"
    echo "4. Mostrar informació de la interfície"
    echo "5. Canviar adreça MAC de la interfície"
    echo "6. Executar un atac de deauth"
    echo "7. Guardar escanejos d'AP en un fitxer"
    echo "8. Sortir"
    echo "********************************************************"
}

# Funció per posar la interfície en mode monitor
posar_mode_monitor() {
    clear
    echo "********************************************************"
    echo "Posant la interfície en mode monitor..."
    echo "********************************************************"
    read -p "Introdueix la interfície de xarxa (p. ex., wlan0): " interface
    sudo airmon-ng start $interface
    echo "********************************************************"
    echo "La interfície $interface ha estat posada en mode monitor."
    echo "********************************************************"
}

# Funció per desactivar el mode monitor
desactivar_mode_monitor() {
    clear
    echo "********************************************************"
    echo "Desactivant el mode monitor..."
    echo "********************************************************"
    read -p "Introdueix la interfície de xarxa (p. ex., wlan0mon): " interface
    sudo airmon-ng stop $interface
    echo "********************************************************"
    echo "El mode monitor ha estat desactivat per la interfície $interface."
    echo "********************************************************"
}

# Funció per escanejar xarxes WiFi i guardar-les en un fitxer CSV
escanejar_i_guardar_csv() {
    clear
    echo "********************************************************"
    echo "Escanejant xarxes WiFi i guardant-les en un fitxer CSV..."
    echo "********************************************************"
    read -p "Introdueix la interfície de xarxa en mode monitor (p. ex., wlan0mon): " interface
    read -p "Introdueix el nom del fitxer CSV (sense extensió): " csv_file
    sudo airodump-ng $interface -w $csv_file
    echo "********************************************************"
    echo "Les xarxes WiFi escanejades han estat guardades en el fitxer CSV $csv_file.csv."
    echo "********************************************************"
}

# Funció per escanejar xarxes WiFi i guardar-les en un fitxer JSON
escanejar_i_guardar_json() {
    clear
    echo "********************************************************"
    echo "Escanejant xarxes WiFi i guardant-les en un fitxer JSON..."
    echo "********************************************************"
    read -p "Introdueix la interfície de xarxa en mode monitor (p. ex., wlan0mon): " interface
    read -p "Introdueix el nom del fitxer JSON (sense extensió): " json_file
    sudo airodump-ng $interface -w $json_file
    echo "********************************************************"
    echo "Les xarxes WiFi escanejades han estat guardades en el fitxer JSON $json_file.json."
    echo "********************************************************"
}

# Resta de funcions...

# Bucle principal
while true; do
    mostrar_menu
    read -p "Selecciona una opció: " opcio
    case $opcio in
        1) posar_mode_monitor ;;
        2) desactivar_mode_monitor ;;
        3) escanejar_xarxes ;;
        4) mostrar_info_interficie ;;
        5) canviar_mac_interficie ;;
        6) executar_deauth ;;
        7) escanejar_i_guardar_csv ;;
        8) escanejar_i_guardar_json ;;
        9) clear; echo "Adeu!"; exit ;;
        *) clear; echo "Opció no vàlida. Torna a intentar."; sleep 2 ;;
    esac
    read -p "Prem ENTER per continuar..."
done
