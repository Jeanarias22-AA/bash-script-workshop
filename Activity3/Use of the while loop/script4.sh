#!/bin/bash

usuarios=$(cut -d: -f1 /etc/passwd | grep '[A-Z]')

echo "Usuarios con letras mayusculas:"
echo "$usuarios"

read -p "Introduce un nombre de usuario: " nombre

while ! id "$nombre" &>/dev/null; do
    echo "El usuario '$nombre' no existe"
    read -p "Introduce un nombre de usuario valido: " nombre
done

echo
echo "Información del usuario '$nombre':"
getent passwd "$nombre"
id "$nombre"
