# pip install pybluez
import bluetooth

def enviar_mensaje():
    nearby_devices = bluetooth.discover_devices(lookup_names=True)
    mensaje = "Hola, este es un mensaje de prueba."
    
    for addr, name in nearby_devices:
        print(f"Enviando mensaje a {name} ({addr})")
        try:
            # Establecer el canal RFCOMM para la comunicación
            port = 1
            sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
            sock.connect((addr, port))
            
            # Enviar el mensaje al dispositivo Bluetooth
            sock.send(mensaje)
            print("Mensaje enviado exitosamente.")
            
            # Cerrar el socket después de enviar el mensaje
            sock.close()
        except Exception as e:
            print(f"Error al enviar el mensaje a {name}: {e}")

enviar_mensaje()

# import bluetooth

#    def enviar_mensaje():
#        nearby_devices = bluetooth.discover_devices(lookup_names=True)
#        for addr, name in nearby_devices:
#            print(f"Enviando mensaje a {name} ({addr})")
#            # Aquí puedes implementar la lógica para enviar el mensaje emergente al dispositivo Bluetooth
#            # Ejemplo: Enviar un archivo de texto con el mensaje a través de RFCOMM
#            # bluetooth.send_text_file(addr, 'mensaje.txt')

#    enviar_mensaje()