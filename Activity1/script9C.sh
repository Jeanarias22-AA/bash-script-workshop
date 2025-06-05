#!/bin/bash

CRACK="jeancarlojeancarlojeancarlojeancarlo"

echo "Resultado de ##*jean: ${CRACK##*jean}"
echo "Resultado de #*jean: ${CRACK#*jean}"
echo "Resultado de %%rlo*: ${CRACK%%rlo*}"
echo "Resultado de %jean*: ${CRACK%jean*}"


