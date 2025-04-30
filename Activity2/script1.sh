#!/bin/bash

# Pedir número al usuario
read -p "Introduce un número entero: " num

# Comprobar si es positivo o negativo
if [ "$num" -gt 0 ]; then
    echo "El número es positivo."
elif [ "$num" -lt 0 ]; then
    echo "El número es negativo."
else
    echo "El número es cero."
fi
