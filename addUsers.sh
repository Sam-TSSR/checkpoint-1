#!/bin/bash


read -p "Ecrivez les noms d'utilisateur que vous souhaitez ajouter " nom

#verification

if [ "$nom" == "" ]; then
	echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi

#on va utiliser for in

	for i in $nom
	do
		if id "$i" &>/dev/null
		then
		echo "L'utilisateur $i existe déjà"
		else
		sudo useradd "$i"

#verification si le code marche correctement		

            if [ $? -eq 0 ]
            then
		    echo "L'utilisateur $i a été crée"
            else
            echo "Erreur à la création de l'utilisateur $i"
            fi
		fi
	done
	exit 0
 
#chmod u+x addUsers.sh et ./addUsers.sh	
