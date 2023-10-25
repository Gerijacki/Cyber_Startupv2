import random
   import string
   
   length = 12
   password = ''.join(random.choices(string.ascii_letters + string.digits + string.punctuation, k=length))
   print(f"Contraseña generada: {password}")