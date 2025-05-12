#!/bin/bash

echo "Bienvenido al juego Rock Paper Scissors"

while true; do
    opciones=("rock" "paper" "scissors")

    maquina=${opciones[$RANDOM % 3]}

    read -p "Elige (rock, paper, scissors) o escribe 'exit' para abandonar: " jugador

    if [[ $jugador == "exit" ]]; then
        echo "Gracias por jugar "
        break
    fi

    if [[ ! " ${opciones[*]} " =~ " $jugador " ]]; then
        echo "Opcion invalida. Introduce de nuevo."
        continue
    fi

    echo "Maquina escogio: $maquina"

    if [[ $jugador == $maquina ]]; then
        echo "Empate"
    elif [[ ($jugador == "rock" && $maquina == "scissors") or \
            ($jugador == "scissors" && $maquina == "paper") or \
            ($jugador == "paper" && $maquina == "rock") ]]; then
        echo "Ganaste"
    else
        echo "Perdiste"
    fi

    echo
done
