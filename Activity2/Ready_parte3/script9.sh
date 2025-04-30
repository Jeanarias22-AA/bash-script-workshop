#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Uso: $0 ruta_directorio nombre_tar.gz"
    exit 1
fi

dir="$1"
output="$2"

if [ ! -d "$dir" ]; then
    echo "Error: '$dir' no es un directorio válido."
    exit 1
fi

if [ -e "$output" ]; then
    read -p "El archivo $output ya existe. ¿Deseas sobrescribirlo? (s/n): " resp
    if [[ "$resp" != "s" ]]; then
        echo "Cancelado por el usuario."
        exit 0
    fi
fi

tar -czf "$output" "$dir"
echo "Directorio comprimido como $output"
