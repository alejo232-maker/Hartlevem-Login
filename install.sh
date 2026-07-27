#!/data/data/com.termux/files/usr/bin/bash

clear
echo "===================================="
echo "      HARTLEVEM LOGIN v1.0"
echo "===================================="

mkdir -p ~/.hartlevem

echo
read -p "Usuario: " USER

while true; do
    read -s -p "Contraseña: " PASS
    echo
    read -s -p "Confirmar contraseña: " PASS2
    echo

    if [ "$PASS" = "$PASS2" ]; then
        break
    else
        echo "❌ Las contraseñas no coinciden."
    fi
done

HASH=$(printf "%s" "$PASS" | sha256sum | awk '{print $1}')

echo "$USER" > ~/.hartlevem/user
echo "$HASH" > ~/.hartlevem/pass

echo
echo "✅ Instalación completada."
echo "Usuario: $USER"
echo
