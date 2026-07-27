#!/data/data/com.termux/files/usr/bin/bash

DATA_DIR="$HOME/.hartlevem"
USERS_DB="$DATA_DIR/users.db"

mkdir -p "$DATA_DIR"
touch "$USERS_DB"

clear
echo "===================================="
echo "     REGISTRO DE USUARIO"
echo "===================================="
echo

read -p "Nuevo usuario: " USER

if grep -q "^$USER:" "$USERS_DB"; then
    echo
    echo "❌ Ese usuario ya existe."
    exit 1
fi

read -s -p "Contraseña: " PASS1
echo
read -s -p "Confirmar contraseña: " PASS2
echo

if [ "$PASS1" != "$PASS2" ]; then
    echo
    echo "❌ Las contraseñas no coinciden."
    exit 1
fi

HASH=$(echo -n "$PASS1" | sha256sum | awk '{print $1}')

echo "$USER:$HASH" >> "$USERS_DB"

echo
echo "✅ Usuario registrado correctamente."
