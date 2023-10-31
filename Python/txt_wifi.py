# pip install flask
 from flask import Flask
   import threading
   import socket

   app = Flask(__name__)

   @app.route('/')
   def enviar_mensaje():
       # Aquí puedes implementar la lógica para enviar el mensaje emergente a través de la red Wi-Fi
       # Ejemplo: Enviar un mensaje HTML como respuesta a la solicitud
       return '<script>alert("Mensaje Emergente");</script>'

   def iniciar_servidor():
       app.run(host='0.0.0.0', port=80)

   if __name__ == '__main__':
       # Inicia el servidor en un hilo separado para que pueda seguir ejecutándose en segundo plano
       servidor_thread = threading.Thread(target=iniciar_servidor)
       servidor_thread.start()