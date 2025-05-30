#!/bin/bash
# ESTE SCRIPT FUNCIONARA EN LA MAQUINA LOCAL, PARA GENERAR UN AUTOMATIZACION EN EL SCRIPT DE MONITORIZACIONV
# Y SE EJECUTE CADA HORA:

DIRECTORIO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CRON="0 * * * * $DIRECTORIOL/monitorizacion.sh --auto >> $DIRECTORIO/monitor.log 2>&1" # PERMITE EJECURAR EL SCRIPT CADA HORA

(crontab -l | grep -Fv "$CRON"; echo "$CRON") | crontab - # AÑADIMOS LA ENTRADA CRONTAB SIN DUPLICARLA DE FORMA AUTOMATICA

echo "Cron configurado para ejecutarse cada hora desde $DIRECTORIO"

