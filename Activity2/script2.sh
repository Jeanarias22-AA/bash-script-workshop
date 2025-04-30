#!/bin/bash

read -p "Introduce un número entero: " num

if [ "$num" -lt 0 ]; then
    echo "El número es negativo."
else
    echo "El número no es negativo."
fi
