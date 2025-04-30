#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 ruta_del_archivo"
    exit 1
fi

archivo="$1"

if [ ! -e "$archivo" ]; then
    echo "Error: El archivo no existe."
    exit 1
fi

tipo=$(file "$archivo")
echo "Tipo de archivo: $tipo"

[ -r "$archivo" ] && echo "Es legible"
[ -w "$archivo" ] && echo "Es escribible"
[ -x "$archivo" ] && echo "Es ejecutable"
