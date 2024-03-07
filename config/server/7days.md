Configurar un servidor de 7 Days to Die en tu servidor de casa con TrueNAS SCALE usando Docker puede ser un proceso detallado. Aquí tienes una guía paso a paso:

**Paso 1: Preparativos**

Antes de comenzar, asegúrate de tener Docker y Docker Compose instalados en tu servidor TrueNAS SCALE. También necesitarás acceso al shell de tu sistema.

**Paso 2: Crear Estructura de Carpetas**

En tu sistema de archivos, crea una estructura de carpetas para almacenar la configuración del servidor y los datos del juego. Puedes hacerlo ejecutando:

```bash
mkdir -p /server/7days/data/serverfiles
mkdir -p /server/7days/data/7daystodie
mkdir -p /server/7days/data/log
mkdir -p /server/7days/data/backups
mkdir -p /server/7days/data/lgsm-config
```

Ajusta `/server/7days` con la ubicación que prefieras.

**Paso 3: Crear el archivo docker-compose.yml**

Crea un archivo llamado `docker-compose.yml` en el directorio donde guardaste la estructura de carpetas, y copia y pega el siguiente contenido:

```yaml
version: '3.8'

services:
  7dtdserver:
    image: vinanrra/7dtd-server
    container_name: 7days-gameserver
    environment:
      - START_MODE=1 
      - VERSION=stable 
      - PUID=1000 # id -u
      - PGID=1000 # id -g
      - TimeZone=Europe/Madrid # ajusta la zona horaria según tu ubicación
    volumes:
      - /server/7days/data/serverfiles:/home/sdtdserver/serverfiles/
      - /server/7days/data/7daystodie:/home/sdtdserver/.local/share/7DaysToDie/
      - /server/7days/data/log:/home/sdtdserver/log/
      - /server/7days/data/backups:/home/sdtdserver/lgsm/backup/
      - /server/7days/data/lgsm-config:/home/sdtdserver/lgsm/config-lgsm/sdtdserver
    ports:
      - 26900:26900/tcp
      - 26900:26900/udp
      - 26901:26901/udp
      - 26902:26902/udp
      - 8080:8080/tcp 
      - 8081:8081/tcp 
      - 8082:8082/tcp
    restart: unless-stopped
    logging:
      driver: "json-file"
      options:
        max-size: "1m"
```

Asegúrate de ajustar las rutas y configuraciones según tus preferencias.

**Paso 4: Iniciar el Servidor**

Ejecuta el siguiente comando para iniciar el servidor:

```bash
docker-compose up -d
```

Esto descargará la imagen del servidor y comenzará a ejecutar el contenedor.

**Paso 5: Configuraciones Adicionales**

Puedes modificar las configuraciones del servidor editando los archivos en `/server/7days/data/serverfiles` y `/server/7days/data/lgsm-config`.

**Paso 6: Verificar el Estado del Servidor**

Para verificar el estado del servidor, ejecuta:

```bash
docker exec -it 7days-gameserver bash
su - sdtdserver
./sdtdserver details
```

**Paso 7: Conectar al Servidor**

En el juego, selecciona "Join A Game", luego "Connect To IP". Si estás en la red local, usa la dirección IP privada de tu servidor y el puerto 26900. Si te conectas a través de Internet, asegúrate de redirigir el puerto 26900 (TCP y UDP) desde tu router a tu servidor.

¡Eso es todo! Ahora deberías tener un servidor 7 Days to Die en tu TrueNAS SCALE. Ajusta cualquier configuración adicional según tus preferencias y disfruta del juego.

Para modificar las características del servidor en 7 Days to Die, puedes ajustar las configuraciones en el archivo `sdtdserver.xml`. Este archivo contiene varias propiedades que controlan aspectos del juego, como la dificultad, la frecuencia de los eventos de sangre (Blood Moon), la velocidad de generación de experiencia, y muchas otras opciones.

Aquí hay un resumen de algunas configuraciones que puedes modificar en `sdtdserver.xml`:

1. **Nombre del Servidor:**
   ```xml
   <property name="ServerName" value="NombreDeTuServidor" />
   ```

2. **Descripción del Servidor:**
   ```xml
   <property name="ServerDescription" value="Descripción de tu servidor" />
   ```

3. **Contraseña del Servidor:**
   ```xml
   <property name="ServerPassword" value="TuContraseña" />
   ```

4. **Puerto del Servidor:**
   ```xml
   <property name="ServerPort" value="26900" />
   ```

5. **Número Máximo de Jugadores:**
   ```xml
   <property name="ServerMaxPlayerCount" value="8" />
   ```

6. **Duración del Día y la Noche:**
   ```xml
   <property name="DayNightLength" value="60" />
   <property name="DayLightLength" value="18" />
   ```

7. **Frecuencia de Eventos de Sangre:**
   ```xml
   <property name="BloodMoonFrequency" value="7" />
   ```

8. **Dificultad del Juego:**
   ```xml
   <property name="GameDifficulty" value="2" />
   ```

9. **Modo de Juego:**
   ```xml
   <property name="GameMode" value="GameModeSurvival" />
   ```

10. **Multiplicador de Experiencia (XP):**
    ```xml
    <property name="XPMultiplier" value="100" />
    ```

Estos son solo ejemplos, y hay muchas más opciones disponibles en el archivo `sdtdserver.xml`. Después de realizar cambios, guarda el archivo y reinicia el servidor ejecutando:

```bash
docker-compose restart
```

Esto aplicará las nuevas configuraciones.

Recuerda que ajustar estas configuraciones puede afectar la experiencia de juego, así que ten cuidado al hacer cambios y asegúrate de comprender cómo cada configuración afecta al juego.