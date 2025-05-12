#!/bin/bash

url="https://agora.xtec.cat/ies-sabadell/"

echo "Verificando la conexion con $url..."

until curl -s --head "$url" | grep "200 OK" &>/dev/null; do
    echo "No hay conexion. Vuelva a intentarlo en unos 5 segundos..."
    sleep 5
done

echo "Conexion establecida. Abrimos la web..."

xdg-open "$url" &>/dev/null
