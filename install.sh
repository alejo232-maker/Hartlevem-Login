#!/data/data/com.termux/files/usr/bin/bash

clear

echo "===================================="
echo "      HARTLEVEM INSTALLER v2.1"
echo "===================================="
echo

echo "[*] Instalando dependencias..."
pkg update -y >/dev/null 2>&1
pkg install -y git bash coreutils figlet >/dev/null 2>&1

chmod +x *.sh 2>/dev/null

mkdir -p "$HOME/.hartlevem"
touch "$HOME/.hartlevem/users.db"

echo
echo "[*] Creando el primer usuario..."
echo

bash register.sh

cat > "$HOME/.bashrc" << 'EOF'
clear

if [ -f "$HOME/Hartlevem-Login/login.sh" ]; then
    cd "$HOME/Hartlevem-Login"
    bash login.sh
fi
EOF

echo
echo "===================================="
echo "      INSTALACIÓN COMPLETADA"
echo "===================================="
echo
echo "✔ Dependencias instaladas"
echo "✔ Sistema configurado"
echo "✔ Usuario registrado"
echo "✔ Inicio automático configurado"
echo
echo "Cierra Termux y vuelve a abrirlo."
