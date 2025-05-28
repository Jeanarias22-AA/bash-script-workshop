#!/bin/bash

USER="administrador"
HOST="192.168.1.98"
SSH_OPTS="-o StrictHostKeyChecking=no"

trap 'echo "Interrupción detectada. Saliendo.."; exit 1' INT TERM



cpu() {
    echo ">> Uso de CPU:"
    ssh $SSH_OPTS $USER@$HOST "top -bn1 | grep 'Cpu(s)'"
}

ram() {
    echo ">> Uso de RAM:"
    ssh $SSH_OPTS $USER@$HOST "free -h"
}

disk() {
    echo ">> Uso de Disco:"
    ssh $SSH_OPTS $USER@$HOST "df -h"
}

services() {
    echo ">> Servicios activos:"
    ssh $SSH_OPTS $USER@$HOST "systemctl list-units --type=service --state=running"
}

ports() {
    echo ">> Puertos abiertos:"
    ssh $SSH_OPTS $USER@$HOST "which netstat || sudo apt update && sudo apt install -y net-tools"
    ssh $SSH_OPTS $USER@$HOST "netstat -tuln"
}

processes() {
    echo ">> Procesos en ejecución:"
    ssh $SSH_OPTS $USER@$HOST "ps aux"
}

files() {
    echo ">> Archivos clave:"
    ssh $SSH_OPTS $USER@$HOST "[ -f /etc/passwd ] && echo 'Existe /etc/passwd' || echo 'No se encuentra /etc/passwd'"
}

backup_info() {
    echo ">> Backup de informacion:"
    ssh $SSH_OPTS $USER@$HOST << EOF > "backup_$(date +%F).txt"
uname -a
lscpu
df -h
free -h
EOF
    echo "Backup guardado como backup_$(date +%F).txt"
}
check_all() {
    echo "MONITORIZACION COMPLETA"
    cpu
    ram
    disk
    services
    ports
    processes
    files
    backup_info
    echo "-----------------------"
}


main() {
    while true; do
	clear
	echo "--------- MENU DE MONITORIZACION REMOTA --------"
        echo "1) Ver uso de CPU"
        echo "2) Ver uso de RAM"
        echo "3) Ver uso de Disco"
        echo "4) Ver servicios activos"
        echo "5) Ver puertos abiertos"
        echo "6) Ver procesos en ejecucion"
	echo "7) Ver archivos clave"
	echo "8) Backup de informacion"
	echo "9) Monitorizacion completa"
        echo "0) Salir"
        echo "------------------------------------------------"
        read -p "Elige una opcion: " opcion
        echo ""
	case $opcion in
            1) cpu ;;
            2) ram ;;
            3) disk ;;
            4) services ;;
            5) ports ;;
            6) processes ;;
	    7) files;;
	    8) backup_info;;
	    9) check_all;;
            0) echo "Saliendo..."; exit 0 ;;
            *) echo "Opción no válida." ;;
        esac
        echo ""
        read -p "Presiona Enter para continuar..."
    done
}
#aplicamos el siguiente if para que el cront en la maquina local pueda automaticamente llamar a la funcion check_all, para realizar una monitorizacion general.
if [[ "$1" == "--auto" ]]; then
    check_all
else
    main
fi
