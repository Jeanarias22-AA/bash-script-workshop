#!/bin/bash

REMOTE_USER="administrador"
REMOTE_HOST="192.168.1.98"
SSH_OPTS="-o StrictHostKeyChecking=no"

trap 'echo "Interrupción detectada. Saliendo.."; exit 1' INT TERM

# Funciones

check_cpu() {
    echo ">> Uso de CPU:"
    ssh $SSH_OPTS $REMOTE_USER@$REMOTE_HOST "top -bn1 | grep 'Cpu(s)'"
}

check_ram() {
    echo ">> Uso de RAM:"
    ssh $SSH_OPTS $REMOTE_USER@$REMOTE_HOST "free -h"
}

check_disk() {
    echo ">> Uso de Disco:"
    ssh $SSH_OPTS $REMOTE_USER@$REMOTE_HOST "df -h"
}

check_services() {
    echo ">> Servicios activos:"
    ssh $SSH_OPTS $REMOTE_USER@$REMOTE_HOST "systemctl list-units --type=service --state=running"
}

check_ports() {
    echo ">> Puertos abiertos:"
    ssh $SSH_OPTS $REMOTE_USER@$REMOTE_HOST "which netstat || sudo apt update && sudo apt install -y net-tools"
    ssh $SSH_OPTS $REMOTE_USER@$REMOTE_HOST "netstat -tuln"
}

check_processes() {
    echo ">> Procesos en ejecución:"
    ssh $SSH_OPTS $REMOTE_USER@$REMOTE_HOST "ps aux"
}

check_files() {
    echo ">> Archivos clave:"
    ssh $SSH_OPTS $REMOTE_USER@$REMOTE_HOST "[ -f /etc/passwd ] && echo 'Existe /etc/passwd' || echo 'No se encuentra /etc/passwd'"
}

backup_info() {
    echo ">> Backup de informacion:"
    ssh $SSH_OPTS $REMOTE_USER@$REMOTE_HOST << EOF > "backup_$(date +%F).txt"
uname -a
lscpu
df -h
free -h
EOF
    echo "Backup guardado como backup_$(date +%F).txt"
}
check_all() {
    echo "MONITORIZACION COMPLETA"
    check_cpu
    check_ram
    check_disk
    check_services
    check_ports
    check_processes
    check_files
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
            1) check_cpu ;;
            2) check_ram ;;
            3) check_disk ;;
            4) check_services ;;
            5) check_ports ;;
            6) check_processes ;;
	    7) check_files;;
	    8) backup_info;;
	    9) check_all;;
            0) echo "Saliendo..."; exit 0 ;;
            *) echo "Opción no válida." ;;
        esac
        echo ""
        read -p "Presiona Enter para continuar..."
    done
}

if [[ "$1" == "--auto" ]]; then
    check_all
else
    main
fi
