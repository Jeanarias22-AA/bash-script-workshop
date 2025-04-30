#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 ruta_del_archivo"
    exit 1
fi

ruta="$1"

if [ ! -e "$ruta" ]; then
    echo "Error: No existe la ruta indicada."
    exit 1
fi

if [ -d "$ruta" ]; then
    echo "Es un directorio."
else
    echo "Es un archivo."

    nombre_archivo=$(basename "$ruta")
    extension="${nombre_archivo##*.}"

    if [ "$extension" != "$nombre_archivo" ]; then
        echo "Extensión del archivo: .$extension"
    else
        echo "El archivo no tiene extensión."
    fi
fi
