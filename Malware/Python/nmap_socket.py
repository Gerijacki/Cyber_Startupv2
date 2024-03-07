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