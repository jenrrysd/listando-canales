#!/bin/bash

while :
do
echo " "
echo -e "CANALES DE YOUTUBE"
echo "-----------------------"
echo "Escoga una opción"
echo "-----------------------"
echo "1.- Pavel Yachay canal en insurgencia "
echo "2.- Timoteo Cutipa Oficial  "
echo "3.- Musica Blues "
echo "0.- Cero, SALIR DEL SCRIPT"

echo -n "SU OPCION ELEGIDA ES EL NÚMERO => "

read opcion
case $opcion in

#
1) echo "Canal Pavel Yachay"
while true; do
  echo "Pavel Yachay-Wasi un canal en insurgencia"
  echo "Esperar unos segundos mientras se lista los videos"
  echo " "

  # Obtener la lista de títulos y URLs de videos del canal y numerarlos
  mapfile -t videos < <(yt-dlp --get-id --get-title --flat-playlist https://www.youtube.com/@PavelYachay | paste - - )

  for i in "${!videos[@]}"; do
    printf "%s\t%s\n" "$((i+1))" "${videos[$i]}"
  done

  # Solicitar al usuario que elija un número de video
  echo " "
  read -p "Ingresa el número del video que deseas reproducir (o escribe salir para volver al menu anterior): " selected_num

  # Verificar si el usuario presionó la tecla "Q"
  if [[ "$selected_num" == "salir" || "$selected_num" == "q" ]]; then
    break  # Salir del bucle y finalizar el script
  fi

  # Obtener la URL del video seleccionado
  selected_url="https://www.youtube.com/watch?v=$(echo "${videos[$((selected_num-1))]}" | cut -f2)"

  # Reproducir solo el audio del video seleccionado con mpv
  mpv --no-video "$selected_url"
done
echo " "

;;

2) echo "Timoteo Cutipa"
while true; do
  echo "24 Noticias Ofical Timoteo Cutipa"
  echo "Esperar unos segundos mientras se lista los videos"
  echo " "

  # Obtener la lista de títulos y URLs de videos del canal y numerarlos
  mapfile -t videos < <(yt-dlp --get-id --get-title --flat-playlist https://www.youtube.com/@24NOTICIASENVIVO | paste - - )

  for i in "${!videos[@]}"; do
    printf "%s\t%s\n" "$((i+1))" "${videos[$i]}"
  done

  # Solicitar al usuario que elija un número de video
  echo " "
  read -p "Ingresa el número del video que deseas reproducir (o escribe salir para volver al menu anterior): " selected_num

  # Verificar si el usuario presionó la tecla "Q"
  if [[ "$selected_num" == "salir" || "$selected_num" == "q" ]]; then
    break  # Salir del bucle y finalizar el script
  fi

  # Obtener la URL del video seleccionado
  selected_url="https://www.youtube.com/watch?v=$(echo "${videos[$((selected_num-1))]}" | cut -f2)"

  # Reproducir solo el audio del video seleccionado con mpv
  mpv --no-video "$selected_url"
done
echo " "

;;

3) echo "Musica Blues"
while true; do
  echo "Canal de Musica Blues"
  echo "Esperar unos segundos mientras se lista los videos"
  echo " "

  # Obtener la lista de títulos y URLs de videos del canal y numerarlos
  mapfile -t videos < <(yt-dlp --get-id --get-title --flat-playlist https://www.youtube.com/@LOVEBLUESSONGS | paste - - )

  for i in "${!videos[@]}"; do
    printf "%s\t%s\n" "$((i+1))" "${videos[$i]}"
  done

  # Solicitar al usuario que elija un número de video
  echo " "
  read -p "Ingresa el número del video que deseas reproducir (o escribe salir para volver al menu anterior): " selected_num

  # Verificar si el usuario presionó la tecla "Q"
  if [[ "$selected_num" == "salir" || "$selected_num" == "q" ]]; then
    break  # Salir del bucle y finalizar el script
  fi

  # Obtener la URL del video seleccionado
  selected_url="https://www.youtube.com/watch?v=$(echo "${videos[$((selected_num-1))]}" | cut -f2)"

  # Reproducir solo el audio del video seleccionado con mpv
  mpv --no-video "$selected_url"
done
echo " "

;;

0) echo "LA OPCION CERO ES PARA SALIR DEL SCRIPT, CHAUUUU" ; exit 0

esac
done
