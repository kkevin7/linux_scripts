#!/bin/bash

#--------Actualizar Majaro----------
sudo pacman-mirrors --fasttrack
sudo pacman -Syyu --noconfirm

#--------Packetes de compilacion de sistema---------
sudo pacman -Syu base-devel
#sudo pacman -Syu --noconfirm autoconf automake binutils bison fakeroot file findutils flex gawk  gcc gettext  grep  groff gzip libtool m4 make pacman patch pkg-config sed sudo systemd texinfo  util-linux which

#------- yaourt ----------------
sudo pacman -S --noconfirm yaourt

#--------Actualizar yaourt----------
yaourt -Syyu --noconfirm --devel --aur

#-------- Kernel 4.14 Linux ---------
#sudo mhwd-kernel -i linux414
#sudo update-grub
#sudo pacman -R --noconfirm linux414 linux414-headers linux414-extramodules

#------ gedit editor text---------------
sudo pacman -S --noconfirm gedit
 
#------- google chrome (fakeroot) ------------------ 
#yaourt -S --noconfirm google-chrome
sudo pacman -S --noconfirm chromium 

#------- Sublime Text ---------------
yaourt -S --noconfirm sublime-text-dev

#---------------- Visual Studio Code --------------------
yaourt -S --noconfirm visual-studio-code-bin
#extensions
code --install-extension vscode-icons-team.vscode-icons
code --install-extension thekalinga.bootstrap4-vscode
code --install-extension lihui.vs-color-picker
code --install-extension vincaslt.highlight-matching-tag
code --install-extension Zignd.html-css-class-completion
code --install-extension felixfbecker.php-intellisense
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension cliffordfajardo.hightlight-selections-vscode
code --install-extension HookyQR.beautify
code --install-extension ms-python.python

#---------- MySql Workbeach ---------------------
sudo pacman -S --noconfirm mysql-workbench

#---------- Netbeans -----------------
yaourt --S --noconfirm netbeans8
#sudo pacman -S --noconfirm netbeans
yaourt -S --noconfirm payara

#------------- Docker -----------------------------------
sudo pacman -S --noconfirm docker
sudo systemctl start docker
#sudo systemctl status docker
sudo systemctl enable docker
sudo usermod -a -G docker $(id -un)

#------------ Docker compose ----------------------------
sudo pacman -S --noconfirm docker-compose

#------------ comando (tree) ----------------------------
sudo pacman -S --noconfirm tree

#---------------- Maven ---------------------------------
sudo pacman -S --noconfirm maven

#------------------- QT Creator ----------------------
#sudo pacman -S --noconfirm qtcreator
#libs
#yaourt -S --noconfirm qt5-websockets

#----------------- WPS Office ----------------------------
#yaourt -S --noconfirm wps-office
#yaourt -S --noconfirm wps-office-extension-spanish-dictionary

#------------------ Libre Office -------------------------
#sudo pacman -R --noconfirm libreoffice-still
sudo pacman -S --noconfirm libreoffice-fresh-es
sudo pacman -S --noconfirm hunspell-es hyphen-es mythes-es

#------------------ Microsoft Office onlie -----------------
sudo pacman -S --noconfirm ms-office-online

#------------------- GParted ------------------------------
sudo pacman -S --noconfirm gparted

#------------ UnRAR o RAR --------------------------------------
sudo pacman -S --noconfirm unrar
#yaourt -S --noconfirm rar

#----------- qBittorrent (alternativa a utorrent) -------
sudo pacman -S --noconfirm qbittorrent

#----------------- JDownloader ----------------
yaourt -S --noconfirm jdownloader2

#---------- pinta (editor de imagen)-------------------------
 sudo pacman -S --noconfirm Pinta

#------------ Wireshark ----------------------------------
sudo pacman -S --noconfirm wireshark-cli wireshark-common wireshark-qt
sudo groupadd wireshark
sudo usermod -a -G wireshark $USER
sudo chgrp $(id -un) /usr/bin/dumpcap
sudo chmod 750 /usr/bin/dumpcap
sudo setcap cap_net_raw,cap_net_admin+eip /usr/bin/dumpcap

#------------ nslookup --------------------------------------
sudo pacman -S --noconfirm dnsutils

#----------- Iperf------------------------
sudo pacman -S --noconfirm iperf3
sudo pacman -S --noconfirm iperf

#----------- htop (ver procesos) ---------------------
sudo pacman -S --noconfirm htop

#----------- Pgadmin Postgres-----------------------------
sudo pacman -S --noconfirm pgadmin3
sudo pacman -S --noconfirm pgadmin4

#----------- PgModeler Postgres --------------------------
yaourt -S --noconfirm pgmodeler

#------------ Foxit Reader -----------------------
yaourt -S --noconfirm foxitreader

#----------- Reproductor vlc ----------------------
sudo pacman -S --noconfirm vlc

#------------ Gimp ----------------------
#sudo pacman -S --noconfirm gimp

#---------- Intellij IDE Ultimate --------------------
#yaourt -S --noconfirm intellij-idea-ultimate-edition

#---------- Intellij IDE Comunity -----------------
#yaourt -S --noconfirm jdk8-openjdk-jetbrains
#sudo pacman -S --noconfirm intellij-idea-community-edition


#------------ UNetbootin ---------------------
yaourt -S --noconfirm unetbootin

#------------ Cligrab --------------------------
#yaourt -S --noconfirm clipgrab-qt5

#----------- Virtualbox -----------------------------
sudo pacman -S --noconfirm virtualbox virtualbox-guest-iso 
#sudo pacman -S --noconfirm linux414-virtualbox-host-modules
sudo pacman -S --noconfirm $(pacman -Qsq "^linux" | grep "^linux[0-9]*[-rt]*$" | awk '{print $1"-virtualbox-host-modules"}' ORS=' ') 
sudo gpasswd -a $USER vboxusers
sudo modprobe vboxdrv
sudo vboxmanage hostonlyif create

#------------ Virt-manager (KVM) ---------------
sudo pacman -S inxi dmidecode gparted && sudo inxi -Fxm
sudo pacman -S virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo usermod -a -G kvm $(id -un)
sudo usermod -a -G libvirt $(id -un)
sudo virsh net-autostart default
sudo virsh net-start default




#------------- Imagenes Docker -----------------------------}
#docker pull mariadb:latest 
#docker pull postgres:latest 
#docker pull debian:stretch
#docker pull payara/server-full 



#------------TEMAS MANJARO------------------------


#----------- ICONOS----------------------------

#----------- Papirus -----------------------------
#yaourt -Sy --noconfirm papirus-icon-theme-git


#----------- OTROS -------------------------------

#----------- XAMPP PHP ----------------------
#yaourt -S --noconfirm xampp


#--------- Brackets (fakeroot)------------------ 
#yaourt -S --noconfirm brackets

#------------------ Lectores PDF (foxit fakeroot)--------------------------
#yaourt -S --noconfirm foxitreader
#sudo pacman -S --noconfirm okular

#----------- viewnior (visualizador de imagenes) -----------
#sudo pacman -S --noconfirm viewnior

#----------- covertidor de images a pdf consola ----------------
#sudo pacman -S --noconfirm imagemagick

#----------- Imagen a texto ---------------
#sudo pacman -S ocrfeeder
#yaourt -S tesseract 


#-------- Django ----------------------
#sudo pacman -S --noconfirm python-django
#sudo pacman -S --noconfirm python2-django
#postgres
#sudo pacman -S --noconfirm python-psycopg2 
#mariaDB
#yaourt -S --noconfirm python-mysqlclient
#-------
#sudo pacman -S python-pip
#sudo pacman -S python-virtualenvwrapper


#----------Postgres -------------------
#sudo pacman -S postgresql
#sudo passwd postgres
#sudo su postgres -l # or sudo -u postgres -i
##initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data/'
##exit
#sudo systemctl enable --now postgresql.service