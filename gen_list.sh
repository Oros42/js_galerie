#!/bin/bash

mini_w="" #200x
mini_h="" #x200

#for i in *.jpg; do convert $i -resize 200x ./${mini_w}/${i}; done
#for i in *.jpg; do convert $i -resize x200 ./${mini_h}/${i}; done

folders="./*/"
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
