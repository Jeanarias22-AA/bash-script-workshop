#!/bin/bash

read -p "Introduce la ruta de un directorio: " dir

until [[ -d "$dir" ]]; do
    echo "La ruta '$dir' no es un directorio valido."
    read -p "Introduce una ruta valida: " dir
done

echo
echo "Permisos del directorio:"
ls -ld "$dir" | awk '{print $1}'

cantidad=$(find "$dir" -mindepth 1 -maxdepth 1 | wc -l)
echo "Cantidad de archivos y subdirectorios: $cantidad"

echo "Contenido:"
ls "$dir"
