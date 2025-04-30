#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 ruta_del_archivo"
    exit 1
fi

archivo="$1"

if [ ! -e "$archivo" ]; then
    echo "Error: El archivo no existe."
    exit 1
fi

echo "Permisos del archivo:"
[ -r "$archivo" ] && echo "- Lectura (read)"
[ -w "$archivo" ] && echo "- Escritura (write)"
[ -x "$archivo" ] && echo "- Ejecución (execute)"
