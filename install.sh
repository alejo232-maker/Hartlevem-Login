#!/data/data/com.termux/files/usr/bin/bash

clear

echo "===================================="
echo "      HARTLEVEM INSTALLER"
echo "===================================="
echo

echo "[*] Instalando dependencias..."
pkg update -y >/dev/null 2>&1
pkg install -y git bash coreutils figlet >/dev/null 2>&1

chmod +x *.sh 2>/dev/null

CONFIG="$HOME/.hartlevem"
mkdir -p "$CONFIG"

echo
read -p "Usuario: " USER

while true
do
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

echo "$USER" > "$CONFIG/user"
printf "%s" "$PASS" | sha256sum | awk '{print $1}' > "$CONFIG/pass"

cat > "$HOME/.bashrc" << 'EOF'
clear

if [ -f "$HOME/Hartlevem-Login/login.sh" ]; then
    cd "$HOME/Hartlevem-Login"
    bash login.sh
fi
EOF

echo
echo "===================================="
echo "      HARTLEVEM INSTALLER"
echo "===================================="
echo
echo "✔ Git instalado"
echo "✔ Dependencias instaladas"
echo "✔ Usuario creado"
echo "✔ Contraseña creada"
echo "✔ Inicio automático configurado"
echo
echo "Instalación completada."
echo
echo "Solo cierra y vuelve a abrir Termux."
