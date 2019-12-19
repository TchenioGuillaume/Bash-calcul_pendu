#!/bin/bash

entry="0"
while [[ "$entry" != "exit" ]] || [[ "$entry" == "" ]]
do
# relance le tout tant qu'il n'y a pas d'exit
	echo "1. déplacer (ls/pwd)"
	echo "2. afficher le contenu d'un fichier"
	echo "3. intéragir avec un fichier"
	echo "4. intéragir avec un dossier"
	echo "5. Ouvrir une image"
	echo "6. chercher un mot dans un fichier"
	read entry

	if [ "$entry" == "1" ] 
	then
		# choix deplacer
		echo $(ls)
		echo $(pwd)
		echo "entrer un dossier :"
		read chemin
		if [ "$chemin" != "" ]
		then
			cd $chemin
		fi
	fi

	if [ "$entry" == "2" ] 
	then
		# choix afficher contenu
		echo $(find . -maxdepth 1 -type f)
		echo "entrer le fichier à afficher :"
		read file
		if [ "$file" != "" ]
		then
			cat $file
		fi
	fi

	if [ "$entry" == "3" ] 
	then
		# choix interagir fichier
		echo "a. Supprimer"
		echo "b. Copier"
		echo "c. Déplacer"
		echo "d. Renommer"
		read entryFile

		if [ "$entryFile" == "a" ] 
		then
			# Supprimer
			echo $(find . -maxdepth 1 -type f)
			echo "Entrer le fichier à supprimer :"
			read file
			if [ "$file" != "" ]
			then
				rm $file
			fi
		fi

		if [ "$entryFile" == "b" ] 
		then
			# Copier
			echo $(find . -maxdepth 1 -type f)
			echo "Entrer le fichier à copier :"
			read file
			if [ "$file" != "" ]
			then
				copy="Copy"
				copyName="$file$copy"
				cp $file $copyName
			fi
		fi

		if [ "$entryFile" == "c" ] 
		then
			# Déplacer
			echo $(find . -maxdepth 1 -type f)
			echo "Entrer le fichier à déplacer :"
			read file
			echo $(ls)
			echo $(pwd)
			echo "Entrer le dossier ou le deplacer :"
			read dir
			if [ "$file" != "" ]
			then
				if [ "$dir" != "" ]
				then
					mv $file $dir
				fi
			fi
		fi

		if [ "$entryFile" == "d" ] 
		then
			# Renommer
			echo $(find . -maxdepth 1 -type f)
			echo "Entrer le fichier à renommer :"
			read file
			echo "Entrer le nouveau nom du fichier :"
			read newName
			if [ "$file" != "" ]
			then
				mv $file $newName
			fi
		fi

		
	fi

	if [ "$entry" == "4" ] 
	then
		# choix interagir dossier
		echo "a. Créer"
		echo "b. Supprimer"
		echo "c. Déplacer"
		echo "d. Renommer"
		read entryDir

		if [ "$entryDir" == "a" ] 
		then
			# Créer
			echo "Entrer le nom du dossier à créer :"
			read dir
			if [ "$dir" != "" ]
			then
				mkdir $dir
			fi
		fi

		if [ "$entryDir" == "b" ] 
		then
			# Supprimer
			echo $(find . -maxdepth 1 -type d)
			echo "Entrer le nom du dossier à supprimer :"
			read dir
			if [ "$dir" != "" ]
			then
				rm -r $dir
			fi
		fi

		if [ "$entryDir" == "c" ] 
		then
			# Déplacer
			echo $(find . -maxdepth 1 -type d)
			echo "Entrer le dossier à déplacer :"
			read dir
			echo $(find . -maxdepth 1 -type d)
			echo $(pwd)
			echo "Entrer le dossier ou le deplacer :"
			read newPlace
			if [ "$dir" != "" ]
			then
				if [ "$newPlace" != "" ]
				then
					mv $dir $newPlace
				fi
			fi
		fi

		if [ "$entryDir" == "d" ] 
		then
			# Renommer
			echo $(find . -maxdepth 1 -type d)
			echo "Entrer le dossier à renommer :"
			read dir
			echo "Entrer le nouveau nom du dossier :"
			read newName
			if [ "$file" != "" ]
			then
				mv $dir $newName
			fi
		fi

	fi

	if [ "$entry" == "5" ] 
	then
		# choix ouvrir image
			echo $(ls)
			echo "Entrer l'image à ouvrir :"
			read image
			if [ "$image" != "" ]
			then
				xdg-open $image
			fi
		
	fi

	if [ "$entry" == "6" ] 
	then
		# choix chercher mot
			echo $(ls)
			echo "Entrer le fichier dans lequel chercher :"
			read file
			echo "Entrer le mot à chercher :"
			read word
			if [ "$file" != "" ]
			then
				if [ "$word" != "" ]
				then
					grep -c $word $file
					grep -o $word $file
					touch log.txt
					grep -o $word $file > log.txt
				fi
			fi
	fi



done