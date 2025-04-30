#!/bin/bash
echo -n "Introduce tu nombre de usuario: "
read username

echo -n "Introduce tu contraseña (no será visible): "
read -s password
echo

echo "Credenciales ingresadas -> Usuario: $username, Contraseña: [oculta]"
