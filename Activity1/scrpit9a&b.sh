#!/bin/bash

CRACK="oriolorioloriol"

# Pregunta A

# Quita la coincidencia más larga desde el inicio
echo "Resultado de ##*ori: ${CRACK##*ori}"

# Quita la coincidencia más corta desde el inicio
echo "Resultado de #*ori: ${CRACK#*ori}"

# Quita la coincidencia más larga desde el final
echo "Resultado de %%ol*: ${CRACK%%ol*}"

# Quita la coincidencia más corta desde el final
echo "Resultado de %ori*: ${CRACK%ori*}"

# Pregunta B
# Estas técnicas permiten modificar textos fácilmente en Bash.
