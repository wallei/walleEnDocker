#!/bin/bash

# Script generado por Walle
# Contacto: wgazzanego@gmail.com

# Limpiar la pantalla
clear

mostrar_contenedores() {
    echo "Contenedores activos:"
    docker ps
}

matar_contenedor() {
    mostrar_contenedores
    read -p "Ingrese el ID o el nombre del contenedor que desea detener: " contenedor
    docker stop $contenedor
    echo "El contenedor $contenedor ha sido detenido."
}

mostrar_consumo_memoria() {
    echo "Consumo de memoria de los contenedores:"
    docker stats
}

mostrar_menu() {
    echo "---- MENU ----"
    echo "1. Mostrar y detener un contenedor"
    echo "2. Mostrar consumo de memoria"
    echo "3. Mostrar solo contenedores"
    echo "4. Salir"
}

ejecutar_menu() {
    while true; do
        mostrar_menu
        read -p "Ingrese su opción: " opcion
        case $opcion in
            1)
                matar_contenedor
                ;;
            2)
                mostrar_consumo_memoria
                ;;
            3)
                mostrar_contenedores
                ;;
            4)
                echo "Saliendo del menú..."
                break
                ;;
            *)
                echo "Opción no válida. Por favor, seleccione una opción válida."
                ;;
        esac
        echo ""
    done
}

ejecutar_menu
