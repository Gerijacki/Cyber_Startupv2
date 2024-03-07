#!/bin/bash

# Especifica la ruta de l'arxiu del diccionari
diccionari="diccionari.txt"

# Especifica la URL del servidor web que vols provar
servidor="http://example.com"

# Funció per comprovar els directoris
function comprovar_directoris {
    while IFS= read -r paraula; do
        url="$servidor/$paraula"
        status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
        if [ "$status" -eq 200 ]; then
            echo "Directori trobat: $url"
        fi
    done < "$diccionari"
}

# Crida la funció per comprovar els directoris
comprovar_directoris
