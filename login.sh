#!/data/data/com.termux/files/usr/bin/bash

DATA_DIR="$HOME/.hartlevem"
USERS_DB="$DATA_DIR/users.db"

clear

if [ ! -f "$USERS_DB" ]; then
    echo "❌ No hay usuarios registrados."
    echo
    echo "Ejecuta: bash register.sh"
    exit 1
fi

TOTAL=$(wc -l < "$USERS_DB")

echo "===================================="
echo "      HARTLEVEM LOGIN v2.1"
echo "===================================="
echo "📅 Fecha: $(date '+%d/%m/%Y')"
echo "🕒 Hora : $(date '+%I:%M:%S %p')"
echo "👥 Usuarios registrados: $TOTAL"
echo "===================================="
echo

INTENTOS=0

while true
do
    read -p "Usuario: " USER
    read -s -p "Contraseña: " PASS
    echo

    HASH=$(printf "%s" "$PASS" | sha256sum | awk '{print $1}')

    if grep -q "^$USER:$HASH$" "$USERS_DB"; then
        clear
        echo "===================================="
        echo "✅ Bienvenido $USER"
        echo "===================================="
        sleep 1
        export HARTLEVEM_USER="$USER"
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
