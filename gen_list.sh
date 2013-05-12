#!/bin/bash

folders="./*/" # ne pas supprimer le dernier /
home=`pwd`
read -p "Utilise t'on des miniatures ? (o/n) " rep
if [ "$rep" == "o" ]; then
	echo "Utilisation de miniatures..."
	if which convert >/dev/null; then
		mini_w="200x"
		mini_h="x200"
		echo "Génération des miniatures. Cela peut prendre plusieurs minutes..."
		for folder in $folders; do
			if [ -d "$folder" ]; then
				cd $folder
				if [ ! -d ${mini_w} ]; then
					mkdir ${mini_w}
				fi
				if [ ! -d ${mini_h} ]; then
					mkdir ${mini_h}
				fi
				for i in *.jpg; do
					if [ ! -f ${mini_w}/$i ]; then
						convert $i -resize 200x ${mini_w}/${i}
					fi
					if [ ! -f ${mini_h}/$i ]; then
						convert $i -resize 200x ${mini_h}/${i}
					fi
				done
			fi
		done
		cd $home
	else
        echo "Merci d'installer imagemagick !"
        echo "apt-get install imagemagick"
        exit
    fi
else
	echo "Pas de miniatures"
	mini_w=""
	mini_h=""
fi
echo "[" > liste_nb.txt
for folder in $folders; do
	if [ -d "$folder" ]; then
		num=1
		cpt=1
		cd "$folder"
		rm liste_*.txt
		echo "[" > liste_${num}.txt
		for i in *.{jpg,png,gif}; do
			if [ -f $i ]; then
				echo "'$i'," >> liste_${num}.txt
				cpt=$(($cpt + 1))
				if [ $cpt -gt $((100 * $num)) ]; then
					echo "true]" >> liste_${num}.txt
					num=$(($num + 1))
					echo "[" > liste_${num}.txt
				fi
			fi
		done
		echo "false]" >> liste_${num}.txt
		cd ..
		echo "['${folder}',${num},${cpt},'${mini_w}','${mini_h}']," >> liste_nb.txt
	fi
done
echo "false]" >> liste_nb.txt
echo "Fin de la génération des listes"
echo "Vous pouvez lancer la galerie :-)"