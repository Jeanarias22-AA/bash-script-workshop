#!/bin/bash

read -p "Introduce la ruta del archivo: " archivo

if [[ ! -f $archivo ]]; then
	echo "El archivo no existe"
	exit 1
fi

archivo2="limpio.txt"
> $archivo2

for l in $(cat "$archivo"); do
	linea=$(echo "$l" | sed 's/\\n/\n/g')

	if [[ $linea != \#* ]]; then
		echo "$linea" >> "archivo2"
	fi
done


read -p "Introduce la palabra o frase que quieres buscar: " palabra

if grep -q "$palabra" "$archivo2"; then
    echo "La palabra/frase '$palabra' existe en el archivo."
else
    echo "La palabra/frase '$palabra' NO existe en el archivo."
fi

read -p "Introduce la oración que quieres agregar al final del archivo: " oracion

echo "$oracion" >> "$archivo2"

echo "La oración se ha agregado correctamente al archivo $archivo2"
