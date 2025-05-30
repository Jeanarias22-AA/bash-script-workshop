FINAL COUNTDOWN - MONITORIZACIÓN REMOTA EN BASH

Este proyecto está pensado para simular el trabajo real de un administrador de sistemas, que necesita revisar el estado de un servidor remoto sin estar físicamente allí. Está desarrollado en Bash y permite hacer chequeos, respaldos y automatizar tareas mediante cron.

----------------------------------------------------------------------------------------------------------------------
CONTENIDO DEL PROYECTO
----------------------------------------------------------------------------------------------------------------------

1. monitorizacion.sh

Este script interactivo permite:
- Ver el uso de la CPU, memoria RAM, disco, servicios activos, puertos abiertos, procesos y archivos clave.
- Hacer un backup del estado general del servidor.
- Usar un menú visual con colores y mensajes claros.
- Ejecutarse automáticamente con el parámetro --auto, ideal para cron.
---------------------------------------------------------------------------------------------------------------------
2. ejecuta_para_programar_cron.sh

Este script:
- Añade una tarea a crontab para ejecutar monitorizacion.sh cada hora.
- Evita entradas duplicadas si se ejecuta más de una vez.
- Detecta la ruta real donde está el script, lo que permite usarlo en cualquier ordenador o carpeta.

---------------------------------------------------------------------------------------------------------------------
INSTRUCCIONES DE USO
------------------------------------------------------------------------------------------------------------------------------------------

1. CONFIGURAR ACCESO SSH SIN CONTRASEÑA

Antes de ejecutar el script, hay que asegurarse de que la conexión SSH al servidor remoto no pida contraseña. Para lograrlo:

a) Si no tienes una clave SSH, genera una con:
   ssh-keygen
   (Solo presiona Enter en todas las preguntas)

b) Copia tu clave pública al servidor:
   ssh-copy-id usuario@IP-del-servidor

Después de esto,debes de poder conectarte por SSH sin necesidad de escribir la contraseña cada vez.
---------------------------------------------------------------------------------------------------------------------
2. DAR PERMISOS Y EJECUTAR

Desde el terminal, dentro de la carpeta del proyecto:

chmod +x monitorizacion.sh ejecuta_para_programar_cron.sh

Luego puedes ejecutar el script con:

./monitorizacion.sh

Para dejarlo programado con cron y que se ejecute automáticamente cada hora:

./ejecuta_para_programar_cron.sh

Esto generará un archivo llamado monitor.log con los resultados.

---------------------------------------------------------------------------------------------------------------------
DETALLES
---------------------------------------------------------------------------------------------------------------------

- Colores en los menús y mensajes para facilitar la lectura.
- Avisos de errores o alertas según los valores monitorizados.
- Backup automático del estado del servidor.
- Es un script completamente portable y sin rutas fijas.

---------------------
Presentacion por:
---------------------

Jean Carlo Arias
Juan Carlos Aguiñio
Actividad final M6UF2NF1 ASIX

