#!/data/data/com.termux/files/usr/bin/bash

while true
do
clear

echo "===================================="
echo "      HARTLEVEM MENU v2.1"
echo "===================================="
echo
echo "👤 Usuario : $HARTLEVEM_USER"
echo "📅 Fecha   : $(date '+%d/%m/%Y')"
echo "🕒 Hora    : $(date '+%I:%M:%S %p')"
echo
echo "===================================="
echo "[1] Información"
echo "[2] Registrar usuario"
echo "[3] Actualizar"
echo "[4] Créditos"
echo "[0] Salir"
echo "===================================="
echo

read -p "Seleccione una opción: " opc

case $opc in

1)
clear
echo "===================================="
echo "        INFORMACIÓN"
echo "===================================="
echo
echo "Proyecto : Hartlevem Login"
echo "Versión  : 2.1"
echo "Sistema  : Termux"
echo "Usuario  : $HARTLEVEM_USER"
echo
read -p "Presiona ENTER para volver..."
;;

2)
bash register.sh
echo
read -p "Presiona ENTER para volver..."
;;

3)
clear
echo "Buscando actualizaciones..."
git pull
echo
read -p "Presiona ENTER para volver..."
;;

4)
clear
echo "===================================="
echo "          CRÉDITOS"
echo "===================================="
echo
echo "Desarrollado por:"
echo "Hartlevem"
echo
read -p "Presiona ENTER para volver..."
;;

0)
clear
echo "Hasta luego..."
exit
;;

*)
echo
echo "❌ Opción inválida."
sleep 1
;;

esac

done
