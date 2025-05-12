#!/bin/bash

positivo=0
negativo=0
zero=0

for num in "$@"; do

    if [[ $num =~ ^-?[0-9]+$ ]]; then

        if (( num > 0 )); then
            ((positivo++))
        elif (( num < 0 )); then
            ((negativo++))
        else
            ((zero++))
        fi

    else
        echo "'$num' no es un numero valido."
    fi

done

echo "Resultados:"
echo "Positivos: $positivos"
echo "Negativos: $negativos"
echo "Iguales a cero: $zero"
