#!/bin/bash

# Ruta al archivo de registro de acceso de Apache
LOG_FILE="/var/log/apache2/access.log"

# Utilizar awk para extraer las direcciones IP y mostrarlas por pantalla
awk '{print $1}' $LOG_FILE | sort | uniq
