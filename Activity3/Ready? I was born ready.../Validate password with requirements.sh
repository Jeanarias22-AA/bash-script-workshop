#!/bin/bash

while true; do
    read -s -p "Introduce una contraseña: " password
    echo

    if [[ ${#password} -lt 8 ]]; then
        echo " La contraseña debe tener al menos 8 caracteres"
    elif [[ ! $password =~ [A-Z] ]]; then
        echo "Debe contener al menos una letra mayuscula."
    elif [[ ! $password =~ [0-9] ]]; then
        echo "Debe contener al menos un numero."
    else
        echo "Contraseña '$password' valida."
        break
    fi
done
