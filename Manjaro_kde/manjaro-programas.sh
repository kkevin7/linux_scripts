#--------Actualizar Majaro----------
sudo pacman-mirrors --fasttrack
sudo pacman -Syyu --noconfirm

#--------Packetes de compilacion de sistema---------
#sudo pacman -Syu base-devel
sudo pacman -Syu --noconfirm autoconf automake binutils bison fakeroot file findutils flex gawk  gcc gettext  grep  groff gzip libtool m4 make pacman patch pkg-config sed sudo systemd texinfo  util-linux which

#------- yaourt ----------------
sudo pacman -S --noconfirm yaourt

#--------Actualizar yaourt----------
yaourt -Syyu --noconfirm --devel --aur

#-------- Kernel 4.14 Linux ---------
sudo mhwd-kernel -i linux414
sudo update-grub
#sudo pacman -R --noconfirm linux414 linux414-headers linux414-extramodules

#------ gedit editor text---------------
sudo pacman -S --noconfirm gedit
 
#------- google chrome (fakeroot) ------------------ 
yaourt -S --noconfirm google-chrome

#------- Sublime Text ---------------
yaourt -S --noconfirm sublime-text-dev

#-------- Java JDK (last realease) (fakeroot)-------------
#yaourt -S --noconfirm jdk

#-------- Java JDK8 (fakeroot)------------------
yaourt -S --noconfirm jdk8

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
#libs
yaourt -S --noconfirm qt5-websockets

#----------------- WPS Office ----------------------------
yaourt -S --noconfirm wps-office
yaourt -S --noconfirm wps-office-extension-spanish-dictionary

#------------------ Libre Office -------------------------
#sudo pacman -R --noconfirm libreoffice-still
sudo pacman -S --noconfirm libreoffice-fresh-es
sudo pacman -S --noconfirm hunspell-es hyphen-es mythes-es

#------------------- GParted ------------------------------
sudo pacman -S --noconfirm gparted

#------------ UnRAR o RAR --------------------------------------
sudo pacman -S --noconfirm unrar
#yaourt -S --noconfirm rar

#----------- qBittorrent (alternativa a utorrent) -------
sudo pacman -S --noconfirm qbittorrent

#----------------- JDownloader ----------------
yaourt -S --noconfirm jdownloader2

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

#----------- Bind9 -------------------------
sudo pacman -S --noconfirm bind

#----------- htop (ver procesos) ---------------------
sudo pacman -S --noconfirm htop

#------------ Liberias de Libc para gcc --------------------
#sudo pacman -S --noconfirm libstdc++5
#sudo pacman -S --noconfirm gcc-multilib

#----------- Pgadmin Postgres-----------------------------
sudo pacman -S --noconfirm pgadmin3

#----------- PgModeler Postgres --------------------------
yaourt -S --noconfirm pgmodeler

#------------ Foxit Reader -----------------------
yaourt -S --noconfirm foxitreader

#---------- Intellij IDE --------------------
#sudo pacman -S --noconfirm intellij-idea-community-edition
yaourt -S --noconfirm intellij-idea-ultimate-edition

#------------ UNetbootin ---------------------
yaourt -S --noconfirm unetbootin

#------------ Cligrab --------------------------
yaourt -S --noconfirm clipgrab-qt5

#------------ CrossOver -------------------------
yaourt -S --noconfirm crossover

#----------- Virtualbox -----------------------------
sudo pacman -S --noconfirm virtualbox virtualbox-guest-iso 
#sudo pacman -S --noconfirm linux49-virtualbox-host-modules
sudo pacman -S --noconfirm linux414-virtualbox-host-modules
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





#----------- GNS3 ------------------------
sudo pacman -S --noconfirm libelf libpcap cmake
yaourt -S --noconfirm dynamips
sudo pacman -S --noconfirm subversion
sudo pacman -S --noconfirm iniparser
yaourt -S --noconfirm iouyap
yaourt -S --noconfirm ubridge
yaourt -S --noconfirm vboxwrapper
sudo pacman -S --noconfirm samba
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


#------------- Imagenes Docker -----------------------------}
docker pull mariadb:latest 
docker pull postgres:latest 
docker pull debian:stretch
docker pull payara/server-full 



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
