#!/data/data/com.termux/files/usr/bin/bash

CONFIG="$HOME/.hartlevem"

clear
echo "===================================="
echo "      HARTLEVEM LOGIN v2.0"
echo "===================================="
echo

if [ ! -f "$CONFIG/user" ] || [ ! -f "$CONFIG/pass" ]; then
    echo "❌ No se encontró ninguna instalación."
    echo
    echo "Ejecuta:"
    echo "bash install.sh"
    exit 1
fi

USER_SAVED=$(cat "$CONFIG/user")
PASS_HASH=$(cat "$CONFIG/pass")

INTENTOS=0

while true
do
    read -p "Usuario: " USER
    read -s -p "Contraseña: " PASS
    echo

    HASH=$(printf "%s" "$PASS" | sha256sum | awk '{print $1}')

    if [ "$USER" = "$USER_SAVED" ] && [ "$HASH" = "$PASS_HASH" ]; then
        clear
        echo "===================================="
        echo "✅ Bienvenido $USER"
        echo "===================================="
        sleep 1
        bash menu.sh
        exit
    else
        INTENTOS=$((INTENTOS+1))
        echo "❌ Usuario o contraseña incorrectos."

        if [ $INTENTOS -ge 5 ]; then
            echo
            echo "🔒 Demasiados intentos."
            echo "Espera 30 segundos..."
            sleep 30
            INTENTOS=0
            clear
        fi
    fi
done
