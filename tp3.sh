#!/bin/bash


echo "entrer votre box (ex:ubuntu/xenial64)"
read box
if [ "$box" != "" ]
then
  # box valide
  echo "entrer le nom de votre folder (ex:./data)"
  read folder
  if [ "$folder" != "" ]
  then
    # folder valide
    echo "entrer le nom de votre synced folder (ex:/var/www/html)"
    read syncedFolder
    if [ "$syncedFolder" != "" ]
    then
      # synced_folder valide
      echo "Votre box $box"
      echo "Nom du dossier distant $folder"
      echo "Nom du dossier distant $syncedFolder"
      echo "Validation (y/n)?"
      read valide

      if [ "$valide" == "y" ]
      then
        # L'user a valider
        mkdir vagrant
        cd vagrant
        mkdir $folder
        vagrant init
        sed -i -r 's~.*config.vm.box =.*~ config.vm.box = "'$box'"~g' Vagrantfile
        sed -i -r 's~.*config.vm.network "private_network".*~ config.vm.network "private_network", ip: "192.168.33.10"~g' Vagrantfile
        sed -i -r 's~.*config.vm.synced_folder.*~ config.vm.synced_folder "'$folder'", "'$syncedFolder'"~g' Vagrantfile
        sed -i -r 's~.*config.vm.provision.*~ config.vm.provision "shell", inline: <<-SHELL~g' Vagrantfile
        sed -i -r 's~.*apt-get update.*~ apt-get update~g' Vagrantfile
        sed -i -r 's~.*# SHELL.*~ SHELL~g' Vagrantfile

        vagrant up
        vagrant ssh
      fi
    fi
  fi
fi
