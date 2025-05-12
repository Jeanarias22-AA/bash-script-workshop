#!/bin/bash

while true; do
    echo
    echo "==== MENÚ ===="
    echo "1. Mostrar fecha y hora actual"
    echo "2. Verificar si un archivo existe"
    echo "3. Salir"
    read -p "Selecciona una opcion: " opcion

    case $opcion in
        1)
            echo "Fecha y hora actual: $(date)"
            ;;
        2)
            read -p "Introduce el nombre del archivo: " archivo
            if [[ -f "$archivo" ]]; then
                echo "El archivo '$archivo' existe."
            else
                echo "El archivo '$archivo' no existe."
            fi
            ;;
        3)
            echo "¡Adios!"
            break
            ;;
        *)
            echo "Opcion no valida. Intentelo de nuevo."
            ;;
    esac
done
