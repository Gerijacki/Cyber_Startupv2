from email.message import EmailMessage
import smtplib

def mailspammer():
    # Atacant:
    sender = "aaa"
    password = "aaaa"

    # Victima:
    recipient = input(f"Introduce una víctima: ")

    # Missatge:
    Subject = input(f"Introduce una titulo: ")
    message = input(f"Introduce el mensaje: ")
    bucle = int(input(f"Introduce el numero de mensajes: "))
    #Bucle:
    contador = 0
    intents = bucle #num de correus a enviar

    email = EmailMessage()
    email["From"] = sender
    email["To"] = recipient
    email["Subject"] = Subject
    email.set_content(message)

    while (contador < intents):
        try:
            smtp = smtplib.SMTP("smtp-mail.outlook.com", port=587)
            smtp.starttls()

            # Iniciar sesión en el servidor SMTP
            smtp.login(sender, password)

            # Enviar el correo electrónico
            smtp.sendmail(sender, recipient, email.as_string())
            print(f"Correo {contador+1} enviado correctamente")
            contador = contador +1

        finally:
            # Cerrar la conexión SMTP
            smtp.quit()

if __name__ == '__main__':          
    mailspammer()