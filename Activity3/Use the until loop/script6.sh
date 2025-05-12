#!/bin/bash

valor=()

while [[ ${#valor[@]} -lt 3 ]]; do
    read -p "Introduce un numero entero: " num

    until [[ "$num" =~ ^-?[0-9]+$ ]]; do
        echo "'$num' no es un numero valido"
        read -p "Introduce un número entero valido: " num
    done

    valor+=("$num")
done

a=${valor[0]}
b=${valor[1]}
c=${valor[2]}

suma=$((a + b + c))
producto=$((a * b * c))

mayor=$a
menor=$a

for i in $b $c; do
    if (( i > mayor )); then
        mayor=$i
    fi
    if (( i < menor )); then
        menor=$i
    fi
done

echo
echo "Suma: $suma"
echo "Producto: $producto"
echo "Mayor valor: $mayor"
echo "Menor valor: $menor"
