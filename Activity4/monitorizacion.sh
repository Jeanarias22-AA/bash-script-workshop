#!/bin/bash

# En esta configuracion hay que cambiar la ip del host ya que no siempre tendremos la misma ip al igual
# que el user por si cambiamos de maquina servidor.
USER="administrador"
HOST="192.168.1.98"
SSH_OPTS="-o StrictHostKeyChecking=no"


RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # Sin color


trap 'echo -e "${RED}Interrupción detectada. Saliendo...${NC}"; exit 1' INT TERM



cpu() {
    echo -e "${CYAN}>> Uso de CPU:${NC}"
    ssh $SSH_OPTS $USER@$HOST "top -bn1 | grep 'Cpu(s)'"
}

ram() {
    echo -e "${CYAN}>> Uso de RAM:${NC}"
    ssh $SSH_OPTS $USER@$HOST "free -h"
}

disk() {
    echo -e "${CYAN}>> Uso de Disco:${NC}"
    ssh $SSH_OPTS $USER@$HOST "df -h"
}

services() {
    echo -e "${CYAN}>> Servicios activos:${NC}"
    ssh $SSH_OPTS $USER@$HOST "systemctl list-units --type=service --state=running"
}

ports() {
    echo -e "${CYAN}>> Puertos abiertos:${NC}"
    ssh $SSH_OPTS $USER@$HOST "which netstat || sudo apt update && sudo apt install -y net-tools"
    ssh $SSH_OPTS $USER@$HOST "netstat -tuln"
}

processes() {
    echo -e "${CYAN}>> Procesos en ejecución:${NC}"
    ssh $SSH_OPTS $USER@$HOST "ps aux"
}

files() {
    echo -e "${CYAN}>> Archivos clave:${NC}"
    ssh $SSH_OPTS $USER@$HOST "[ -f /etc/passwd ] && echo 'Existe /etc/passwd' || echo 'No se encuentra /etc/passwd'"
}

backup() {
    echo -e "${YELLOW}>> Backup de información:${NC}"
    ssh -T $SSH_OPTS $USER@$HOST << EOF > "backup_$(date +%F).txt"
uname -a
lscpu
df -h
free -h
EOF
    echo -e "${GREEN}Backup guardado como backup_$(date +%F).txt${NC}"
}

check_all() {
    echo -e "${YELLOW}------------MONITORIZACIÓN COMPLETA ----------${NC}"
    cpu
    ram
    disk
    services
    ports
    processes
    files
    backup
    echo -e "${YELLOW}---------------------------------------------${NC}"
}


main() {
    while true; do
        clear
        echo -e "${GREEN}-----------MENU DE MONITORIZACION REMOTA -----------${NC}"
        echo -e "${CYAN}Fecha y hora: $(date)${NC}"
        echo "1) Ver uso de CPU"
        echo "2) Ver uso de RAM"
        echo "3) Ver uso de Disco"
        echo "4) Ver servicios activos"
        echo "5) Ver puertos abiertos"
        echo "6) Ver procesos en ejecución"
        echo "7) Ver archivos clave"
        echo "8) Realizar Backup"
        echo "9) Monitorización completa"
        echo "0) Salir"
        echo -e "${GREEN}---------------------------------------------------${NC}"
        read -p "Elige una opción: " opcion
        echo ""
        case $opcion in
            1) cpu ;;
            2) ram ;;
            3) disk ;;
            4) services ;;
            5) ports ;;
            6) processes ;;
            7) files ;;
            8) backup ;;
            9) check_all ;;
            0) echo -e "${GREEN}¡Hasta luego!${NC}"; exit 0 ;;
            *) echo -e "${RED}Opción no válida.${NC}" ;;
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
