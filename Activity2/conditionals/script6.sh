#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Error: Debes proporcionar una operación (add, subtract, multiply, divide) y dos enteros."
    exit 1
fi

op="$1"
a="$2"
b="$3"

if ! [[ "$a" =~ ^-?[0-9]+$ && "$b" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Los dos últimos parámetros deben ser enteros."
    exit 1
fi

case "$op" in
    add)
        echo "Resultado: $((a + b))"
        ;;
    subtract)
        echo "Resultado: $((a - b))"
        ;;
    multiply)
        echo "Resultado: $((a * b))"
        ;;
    divide)
        if [ "$b" -eq 0 ]; then
            echo "Error: División por cero no permitida."
            exit 1
        fi
        echo "Resultado: $((a / b))"
        ;;
    *)
        echo "Error: Operación inválida. Usa: add, subtract, multiply o divide."
        exit 1
        ;;
esac
