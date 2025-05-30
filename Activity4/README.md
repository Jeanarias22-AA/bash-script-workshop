# Final Countdown - Monitorización Remota en Bash

Este proyecto de scripting Bash simula el trabajo de un administrador de sistemas que necesita monitorizar un servidor remoto desde su máquina local. Contiene funcionalidades completas de chequeo, backup, ejecución programada con `cron` y presentación visual profesional.

---

## Contenido del proyecto

### `monitorizacion.sh`
Script interactivo y automatizado que realiza:
- Verificación de uso de **CPU**, **RAM**, **disco**, **servicios activos**, **puertos abiertos**, **procesos** y **archivos clave**.
- Generación de **backup** del estado del servidor.
- **Menú interactivo** con colores ANSI y buena presentación.
- Modo automático (`--auto`) para integrarse con tareas `cron`.

### `ejecuta_para_programar_cron.sh`
Script que:
- Añade automáticamente una entrada en `crontab` del usuario local.
- Ejecuta `monitorizacion.sh` cada hora sin duplicar entradas.
- Detecta la ruta real de ejecución dinámicamente (portabilidad total).

---

## Instrucciones de uso

### 1. 🔐 Configurar conexión SSH sin contraseña
Desde la máquina local, se tiene que ejecutar lo siguiente:

```bash
ssh-keygen               # (si no tienes clave)
ssh-copy-id usuario@respectiva ip del servidor


