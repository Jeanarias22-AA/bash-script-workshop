#!/bin/bash


echo "=== Sin comillas ==="
echo "\$*: $*"
echo "\$@: $@"

echo -e "\n=== Con comillas ==="
echo "\"\$*\": \"$*\""
echo "\"\$@\": \"$@\""

echo -e "\n=== Resultado con 'printf' ==="
echo "Usando \$*:"
printf "[%s]\n" $*

echo -e "\nUsando \$@:"
printf "[%s]\n" $@

echo -e "\n=== Explicación ==="
echo "\$* trata todos los argumentos como una sola cadena"
echo "\$@ mantiene los argumentos separados correctamente"
echo "Nota: La diferencia es visible especialmente cuando los argumentos contienen espacios"
