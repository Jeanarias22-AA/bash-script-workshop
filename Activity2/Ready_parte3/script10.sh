#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Uso: $0 archivo.txt|csv protocolo"
    exit 1
fi

archivo="$1"
protocolo="$2"

if [ ! -f "$archivo" ]; then
    echo "Error: El archivo no existe."
    exit 1
fi

if [[ "$archivo" != *.txt && "$archivo" != *.csv ]]; then
    echo "Error: El archivo debe tener extensión .txt o .csv"
    exit 1
fi

conteo=$(grep -i -c "$protocolo" "$archivo")

if [ "$conteo" -eq 0 ]; then
    echo "No se encontraron coincidencias con el protocolo '$protocolo'."
else
    echo "Se encontraron $conteo líneas con el protocolo '$protocolo'."
fi
