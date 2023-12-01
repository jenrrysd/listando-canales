#!/bin/bash

while :
do
echo " "
echo -e "CANALES DE YOUTUBE"
echo "-----------------------"
echo "Escoga una opción"
echo "-----------------------"
echo "1.- STING Fields of gold "
echo "2.- 80'S  "
echo "3.- Musica Blues "
echo "0.- Cero, SALIR DEL SCRIPT"

echo -n "SU OPCION ELEGIDA ES EL NÚMERO => "

read opcion
case $opcion in

#
1) echo "STING"
while true; do
  echo "Sting - Fields of Gold Album"
  echo "Esperar unos segundos mientras se lista los videos"
  echo " "

  # Obtener la lista de títulos y URLs de videos del canal y numerarlos
  mapfile -t videos < <(yt-dlp --get-id --get-title --flat-playlist https://www.youtube.com/playlist?list=PLbjjWAqGwIPABtyryhgqKD93uqr-89Mtl | paste - - )

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

2) echo "80'S"
while true; do
  echo "Musica de los 80s"
  echo "Esperar unos segundos mientras se lista los videos"
  echo " "

  # Obtener la lista de títulos y URLs de videos del canal y numerarlos
  mapfile -t videos < <(yt-dlp --get-id --get-title --flat-playlist https://www.youtube.com/playlist?list=PLmXxqSJJq-yXrCPGIT2gn8b34JjOrl4Xf | paste - - )

  for i in "${!videos[@]}"; do
    printf "%s\t%s\n" "$((i+1))" "${videos[$i]}"
  done

  # Solicitar al usuario que elija un número de video
  echo " "
  read -p "Ingresa el número del video que deseas reproducir (o escribe salir para volver al menu anterior): " selected_num

  # Verificar si el usuario presionó la tecla "Q"
  if [[ "$selected_num" == "salir" ]]; then
    break  # Salir del bucle y finalizar el script
    
  fi
  


# Reproducir continuamente a partir del número seleccionado
  for ((i = selected_num - 1; i < ${#videos[@]}; i++)); do
    selected_url="https://www.youtube.com/watch?v=$(echo "${videos[$i]}" | cut -f2)"
    mpv --no-video --term-status-msg="Título: \${media-title} | Tiempo: \${time-pos} / \${duration} " "$selected_url"
  
    mpv_pid=(pgrep mpv)
    #while true; do
    read -rsn1 key
    if [[ $key == "q" ]]; then
	    break   
	    kill "$mpv_pid"  # Terminar el proceso mpv al presionar 'q'
    fi
    #done

    # Agregar un pequeño retraso entre canciones (puedes ajustar el valor según sea necesario)
    #sleep 5
  done

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
