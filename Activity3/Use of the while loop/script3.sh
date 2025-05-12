#!/bin/bash

read -p "Introduce el nombre del archivo donde se guardara las palabras: " archivo

if  [[ ! -f $archivo ]]; then
	touch "$archivo"
	echo "Archivo '$archivo' creado exitosamente."
else 
	echo "El archivo '$archivo' existe procederemos a guardar todo ahi"
fi

while true; do 
	read -p "Introduce una palabra o (:>) para salir: " palabra

	if [[ $palabra == ":>" ]]; then
		echo "Finalizando guardado de palabras"
		break
	fi

	echo "$palabra" >> "$archivo"

done
