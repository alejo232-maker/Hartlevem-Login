#!/data/data/com.termux/files/usr/bin/bash

while true
do
clear

echo "===================================="
echo "        HARTLEVEM MENU"
echo "===================================="
echo
echo "[1] Información"
echo "[2] Actualizar"
echo "[3] Créditos"
echo "[0] Salir"
echo
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
echo "Versión  : 2.0"
echo "Sistema  : Termux"
echo
read -p "Presiona ENTER para volver..."
;;

2)
clear
echo "Buscando actualizaciones..."
git pull
echo
read -p "Presiona ENTER para volver..."
;;

3)
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
