
# auto-bspwm
> Aquest és un script Bash que automatitza la configuració d'un entorn professional per a hacking a Kali Linux utilitzant el gestor de finestres en mosaics [bspwm](https://github.com/baskerville/bspwm).

## Instal·lació
1. Instal·la les actualitzacions disponibles.

```shell
sudo apt update
sudo apt upgrade -y
```

2. Clona el repositori i accedeix-hi.

```shell
git clone https://github.com/r1vs3c/auto-bspwm.git
cd auto-bspwm
```

3. Atorga permisos d'execució a l'script.

```shell
chmod +x setup.sh
```

4. Executa l'script.

```shell
./setup.sh
```

5. Després que l'script hagi acabat, se t'indicarà que reinicis el sistema. Un cop hagis reiniciat, selecciona `bspwm` com a gestor de finestres i inicia sessió.

## Visió general de l'entorn
![overview1](/assets/overview1.png "overview1")

![overview2](/assets/overview2.png "overview2")

![overview3](/assets/overview3.png "overview3")

## Dreceres de teclat
- <kbd>Windows</kbd> + <kbd>Enter</kbd>: Obre una finestra d'emulador de terminal (kitty).
- <kbd>Windows</kbd> + <kbd>W</kbd>: Tanca la finestra actual.
- <kbd>Windows</kbd> + <kbd>Alt</kbd> + <kbd>R</kbd>: Reinicia la configuració del bspwm.
- <kbd>Windows</kbd> + <kbd>Alt</kbd> + <kbd>Q</kbd>: Tanca la sessió.
- <kbd>Windows</kbd> + <kbd>(⬆⬅⬇➡)</kbd>: Navega entre finestres a l'espai de treball actual.
- <kbd>Windows</kbd> + <kbd>D</kbd>: Obre Rofi. Prem <kbd>Esc</kbd> per sortir.
- <kbd>Windows</kbd> + <kbd>(1,2,3,4,5,6,7,8,9,0)</kbd>: Canvia a l'espai de treball respectiu.
- <kbd>Windows</kbd> + <kbd>T</kbd>: Canvia la finestra actual al mode mosaics.
- <kbd>Windows</kbd> + <kbd>M</kbd>: Alterna la finestra actual al mode "complet" (no ocupa la barra de polybar). Prem les mateixes tecles per tornar al mode mosaics.
- <kbd>Windows</kbd> + <kbd>F</kbd>: Canvia la finestra actual al mode pantalla completa (ocupa tota la pantalla, incloent la polybar).
- <kbd>Windows</kbd> + <kbd>S</kbd>: Canvia la finestra actual al mode flotant.
- <kbd>Windows</kbd> + <kbd>Shift</kbd> + <kbd>(1,2,3,4,5,6,7,8,9,0)</kbd>: Mou la finestra actual a un altre espai de treball.
- <kbd>Windows</kbd> + <kbd>Alt</kbd> + <kbd>(⬆⬅⬇➡)</kbd>: Redimensiona la finestra actual (només funciona si està en mode flotant).
- <kbd>Windows</kbd> + <kbd>Ctrl</kbd> + <kbd>(⬆⬅⬆➡)</kbd>: Canvia la posició de la finestra actual (només funciona si està en mode flotant).
- <kbd>Windows</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd>: Obre Firefox.
- <kbd>Windows</kbd> + <kbd>Shift</kbd> + <kbd>B</kbd>: Obre Burpsuite.
- <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>L</kbd>: Bloqueja la pantalla.
- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>⬆⬇</kbd>: Augmenta/disminueix el volum.
- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>M</kbd>: Silencia/desilencia el volum.
- <kbd>Windows</kbd> + <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>(⬆⬅⬇➡)</kbd>: Mostra una preselecció i després obre una finestra (kitty, Firefox, gestor de fitxers, etc.).
   - <kbd>Windows</kbd> + <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Espai</kbd>: Desfés la preselecció.
- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Enter</kbd>: Obre una subfinestra a la finestra actual.
- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Z</kbd>: Fa un zoom a la subfinestra actual.
- <kbd>Ctrl</kbd> + <kbd>(⬆⬅⬇➡)</kbd>: Navega entre les subfinestres a la finestra actual.
- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd>: Redimensiona la subfinestra actual. Després, utilitza:
   - <kbd>W</kbd> per 'Ampliar'
   - <kbd>N</kbd> per 'Estretar'
   - <kbd>T</kbd> per 'Alçar'
   - <kbd>S</kbd> per 'Abaixar'
   - <kbd>R</kbd> per 'Restablir'
   - <kbd>Esc</kbd> per sortir del mode de redimensionament.
- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>L</kbd>: Alterna l'ordre de les subfinestres.
- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd>: Tanca la subfinestra o la pestanya actual.
- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>T</kbd>: Obre una pestanya