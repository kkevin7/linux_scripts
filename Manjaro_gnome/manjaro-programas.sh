#--------Actualizar Majaro----------
sudo pacman-mirrors -g
sudo pacman -Syyu --noconfirm

#--------Packetes de compilacion de sistema---------
sudo pacman -Syu base-devel

#------- yaourt ----------------
sudo pacman -S --noconfirm yaourt

#--------Actualizar yaourt----------
yaourt -Syyu --devel --aur

#--------- Binarios necesario -------
sudo pacman -S --noconfirm binutils
 
#------ gedit editor text---------------
sudo pacman -S --noconfirm gedit
 
#------- google chrome (fakeroot) ------------------ 
yaourt -S --noconfirm google-chrome

#------- Sublime Text ---------------
yaourt -S --noconfirm sublime-text-dev

#-------- Java JDK (last realease) (fakeroot)-------------
yaourt -S --noconfirm jdk

#-------- Java JDK8 (fakeroot)------------------
yaourt -S --noconfirm jdk8

#--------- Brackets (fakeroot)------------------ 
#yaourt -S --noconfirm brackets

#---------- MySql Workbeach ---------------------
sudo pacman -S --noconfirm mysql-workbench

#---------- Netbeans -----------------
sudo pacman -S --noconfirm netbeans

#------------- Docker -----------------------------------
sudo pacman -S --noconfirm docker
sudo systemctl start docker
#sudo systemctl status docker
sudo systemctl enable docker
sudo usermod -a -G docker $(id -un)

#------------ Docker compose ----------------------------
sudo pacman -S --noconfirm docker-compose

#---------------- Maven ---------------------------------
sudo pacman -S --noconfirm maven

#------------------- QT Creator ----------------------
sudo pacman -S --noconfirm qtcreator

#----------------- WPS Office ----------------------------
yaourt -S --noconfirm wps-office
yaourt -S --noconfirm wps-office-extension-spanish-dictionary

#------------------ Libre Office -------------------------
sudo pacman -S --noconfirm libreoffice-fresh-es

#------------------ Lectores PDF (foxit fakeroot)--------------------------
yaourt -S --noconfirm foxitreader
sudo pacman -S --noconfirm okular

#------------ UnRAR o RAR --------------------------------------
sudo pacman -S --noconfirm unrar
#yaourt -S --noconfirm rar

#----------- qBittorrent (alternativa a utorrent) -------
sudo pacman -S --noconfirm qbittorrent

#------------ Wireshark ----------------------------------
sudo pacman -S --noconfirm wireshark-cli wireshark-common wireshark-gtk wireshark-qt

sudo chgrp $(id -un) /usr/bin/dumpcap
sudo chmod 750 /usr/bin/dumpcap
sudo setcap cap_net_raw,cap_net_admin+eip /usr/bin/dumpcap

#------------ nslookup --------------------------------------
sudo pacman -S --noconfirm dnsutils

#------------ Liberias de Libc para gcc --------------------
sudo pacman -S --noconfirm libstdc++5
sudo pacman -S --noconfirm gcc-multilib

#----------- PgModeler Postgres --------------------------
yaourt -S --noconfirm pgmodeler

#----------- Pgadmin Postgres-----------------------------
sudo pacman -S --noconfirm pgadmin3

#----------- viewnior (visualizador de imagenes) -----------
sudo pacman -S --noconfirm viewnior

#----------- covertidor de images a pdf consola ----------------
sudo pacman -S --noconfirm imagemagick

#----------- htop (ver procesos) ---------------------
sudo pacman -S --noconfirm htop

#----------- Virtualbox -----------------------------
#uname -r para version de kernel (linux49 por el actual)
sudo pacman -S virtualbox virtualbox-guest-iso linux49-virtualbox-host-modules
sudo gpasswd -a $USER vboxusers
sudo modprobe vboxdrv
#solucion vboxnet()
sudo vboxmanage hostonlyif create

#----------- VMware (fakeroot) ---------------------
#yaourt -S --noconfirm vmware-workstation
##sudo pacman -S linux-headers
#sudo pacman -S linux49-headers


#----------- GNS3 ------------------------
sudo pacman -S --noconfirm libelf libpcap cmake
yaourt -S --noconfirm dynamips
sudo pacman -S --noconfirm subversion
sudo pacman -S --noconfirm iniparser
yaourt -S --noconfirm iouyap
yaourt -S --noconfirm ubridge
yaourt -S --noconfirm vboxwrapper
sudo pacman -S --noconfirm lib32-openssl lib32-gcc-libs
sudo pacman -S --noconfirm qemu
sudo pacman -S --noconfirm libvirt
yaourt --m-arg "--skipchecksums" -S --noconfirm gns3-server
yaourt -S --noconfirm gns3-gui


#-------- GNS3 file iouyap ------------------
#Tiene que existir el directorio /usr/local/bin
cd /tmp
git clone https://github.com/GNS3/iouyap.git
cd iouyap*
bison -ydv netmap_parse.y
flex netmap_scan.l
gcc -Wall -g *.c -o iouyap -liniparser -lpthread
strip --strip-unneeded iouyap
sudo mv iouyap /usr/local/bin/
rm -R -f /tmp/iouyap
cd $HOME
sudo setcap cap_net_admin,cap_net_raw=ep $(which iouyap)

#-------- GNS3 file iouyap ------------------
cd /tmp
git clone https://github.com/GNS3/ubridge.git
cd ubridge*
make
sudo make install
sudo rm -R -f /tmp/ubridge
cd $HOME

#--------- GNS3 file vpcs (suele dar error) -------------------
cd /tmp
git clone https://github.com/GNS3/vpcs.git
cd vpcs/src
./mk.sh
sudo cp -r vpcs /usr/local/bin/
sudo rm -R -f /tmp/vpcs
cd $HOME


#----------- Imagen a texto ---------------
#sudo pacman -S ocrfeeder
#yaourt -S tesseract 


#------------- Imagenes Docker -----------------------------}
docker pull mariadb:latest && \
docker pull postgres:latest && \
docker pull postgres:9.6.3-alpine && \
docker pull payara/server-full 



#------------TEMAS MANJARO------------------------

#----------- Numix ------------------------
sudo pacman -S --noconfirm numix-themes-archblue
sudo pacman -S --noconfirm numix-gtk-theme
yaourt -S --noconfirm numix-circle-icon-theme-git 

#-------------Adapta-----------------------------
sudo pacman -Sy --noconfirm adapta-gtk-theme


#----------- ICONOS----------------------------

#----------- Papirus -----------------------------
yaourt -Sy --noconfirm papirus-icon-theme-git
