#!/bin/bash

#--------Actualizar Majaro----------
sudo pacman-mirrors --fasttrack
sudo pacman -Syyu --noconfirm

#--------Packetes de compilacion de sistema---------
sudo pacman -Syu --noconfirm base-devel
#sudo pacman -Syu --noconfirm autoconf automake binutils bison fakeroot file findutils flex gawk  gcc gettext  grep  groff gzip libtool m4 make pacman patch pkg-config sed sudo systemd texinfo  util-linux which

#------- yay ----------------
sudo pacman -S --noconfirm yay

#------------ snap------------ 
sudo pacman -S --noconfirm snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install core

#--------Actualizar yay----------
yay -Syua --noconfirm

#-------- Terminal zsh --------------
sudo pacman -S --noconfirm zsh

#------ gedit editor text---------------
sudo pacman -S --noconfirm gedit

#------- brave browser ------------------
sudo pacman -S --noconfirm brave-browser
 
#------- google chrome ------------------
yay -S --noconfirm google-chrome

#------- Firefox Developer ------------------ 
sudo pacman -S --noconfirm firefox-developer-edition

#------- Sublime Text ---------------
yay -S --noconfirm sublime-text-4

#------- Visual Studio Code -------------
yay -S --noconfirm visual-studio-code-bin
#------- extensions -------------
sh ../vscode/vscode-extensions.sh

#---------- Postman ----------------
yay -S --noconfirm postman-bin

#------------ git ---------------------------
#git config --global user.name "Kevin Martinez"
#git config --global user.email "kkevinmartinez7@gmail.com"
git config --global --unset user.name
git config --global --unset user.email
git config --global core.editor "code"

#------------- Docker -----------------------------------
sudo pacman -S --noconfirm docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker $(id -un)

#------------ Docker compose ----------------------------
sudo pacman -S --noconfirm docker-compose

#------------ comando (tree) ----------------------------
sudo pacman -S --noconfirm tree

#---------- Web Storm -----------------------------
#yay -S --noconfirm webstorm
#yay -S --noconfirm phpstrom

#---------- Python ----------------
sudo pacman -S python-pip

#---------- PyCharm ----------------
sudo pacman -S pycharm-community-edition

#----------- obsidian ----------------------
sudo pacman -S --noconfirm obsidian

#----------- Reproductor vlc ----------------------
sudo pacman -S --noconfirm vlc

#----------- Reproductor rhythmbox ----------------------
sudo pacman -S --noconfirm rhythmbox

#------------------ Libre Office -------------------------
sudo pacman -S --noconfirm libreoffice-fresh-es
sudo pacman -S --noconfirm hunspell-es_sv hyphen-es mythes-es

#------------------ Microsoft Office onlie -----------------
sudo pacman -S --noconfirm ms-office-online

#------------------- Etcher (Boot USB) ---------------------
sudo pacman -S --noconfirm etcher

#------------------- GParted ------------------------------
sudo pacman -S --noconfirm gparted

#------------ UnRAR o RAR --------------------------------------
sudo pacman -S --noconfirm unrar
#yay -S --noconfirm rar

#--------------- Viewnior (Visualizador de imagenes) -----------
sudo pacman -S --noconfirm viewnior

#----------- qBittorrent (alternativa a utorrent) -------
sudo pacman -S --noconfirm qbittorrent

#----------------- JDownloader ----------------
yay -S --noconfirm jdownloader2

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

#---------- MySql Workbeach ---------------------
sudo pacman -S --noconfirm mysql-workbench
yay -S --noconfirm gnome-keyring

#----------- PgModeler Postgres --------------------------
#yay -S --noconfirm pgmodeler

#------------ Foxit Reader -----------------------
yay -S --noconfirm foxitreader

#------------ Gimp ----------------------
#sudo pacman -S --noconfirm gimp

#------------ Apache & PHP ------------------
#sudo pacman -S --noconfirm php7 php7-apache php7-cgi php7-mongodb php7-fpm php7-embed php7-intl php7-imap php7-gd php7-redis php7-snmp php7-memcache php7-sqlite php7-pgsql php7-odbc
sudo pacman -S --noconfirm php php-apache php-cgi php-fpm php-gd php-embed php-intl php-redis php-snmp php-pgsql php-odbc php-sodium php-sqlite
yay -S --noconfirm php-pdo_sqlsrv
sudo systemctl enable httpd
sudo systemctl restart httpd

#------------------ Composer ------------------
sudo pacman -S --noconfirm composer

#------------------ Laravel ------------------
composer global require laravel/installer
echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ~/.bashrc
echo "PATH=\"$HOME/.config/composer/vendor/bin:$PATH\"" >> ~/.zshrc
#source ~/.bashrc
#source ~/.zshrc

#------------ nvm ------------------------------
sudo pacman -S --noconfirm nvm
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

cat /proc/sys/fs/inotify/max_user_watches
# sudo sysctl fs.inotify.max_user_watches=65535
# cat /usr/lib/sysctl.d/10-manjaro.conf
sudo sysctl -p
# echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf

#React JS
sudo npm i -g create-react-app
#Angular JS
sudo npm install -g @angular/cli
#Vue JS
sudo npm install -g @vue/cli
sudo npm install -g create-nuxt-app
#TypeScript
sudo npm i -g typescript
#Sass
sudo npm install -g sass
#eslint
sudo npm i -g eslint


#------------ Yarn ------------------------------
sudo pacman -S --noconfirm yarn

#----------- Redis -----------------------------
yay -S --noconfirm redis
sudo systemctl enable redis
sudo systemctl start redis

#----------- Supervisor -----------------------------
sudo pacman -S --noconfirm supervisor

#----------- Flameshot -----------------------
sudo pacman -S --noconfirm flameshot

#----------- Robo 3T for MongoDB -----------------------
yay -S --noconfirm robo3t-bin 

#----------- Slack desktop -----------------------
yay -S --noconfirm slack-desktop

#----------- Jetbrains DataGrid --------------------------
sudo snap install datagrip --classic

#---------- OBS Studio ---------------------
sudo snap install obs-studio --classic

#----------- Filezilla --------------------------
sudo pacman -S --noconfirm filezilla

#----------- Wireguard (VPN) --------------------------
sudo pacman -S --noconfirm wireguard-tools

#----------- Peek ---------------------------------
sudo pacman -S peek --noconfirm 

#----------- AWS Console ---------------------------------
sudo pacman -S aws-cli --noconfirm 

#----------- Virtualbox -----------------------------
sudo pacman -S --noconfirm virtualbox virtualbox-guest-iso $(pacman -Qsq "^linux" | grep "^linux[0-9]*[-rt]*$" | awk '{print $1"-virtualbox-host-modules"}' ORS=' ') 
yay -S --noconfirm virtualbox-ext-oracle
sudo gpasswd -a $USER vboxusers
sudo modprobe vboxdrv
#share folder
# sudo adduser $USER vboxsf

#----------- Apache BenchMark ------------------------
yay -S --noconfirm  httperf-git

#----------- gtkhash ------------------------
sudo pacman -S --noconfirm

#----------- ngrok ------------------------
yay -S --noconfirm ngrok

#----------- mkcert -----------------------
sudo pacman -S --noconfirm mkcert
sudo npm install -g local-ssl-proxy
# mkcert localhost
# local-ssl-proxy --source 3010 --target 3000 --cert localhost.pem --key localhost-key.pem

#################################### JAVA Environment ###################################

#---------------- Maven ---------------------------------
sudo pacman -S --noconfirm maven

#-------- Java OpenJDK ------------------------
sudo pacman -S --noconfirm jdk8-openjdk
sudo pacman -S --noconfirm jdk11-openjdk
sudo pacman -S --noconfirm jdk-openjdk
#sudo archlinux-java set java-11-openjdk

#---------- Netbeans -----------------
sudo pacman -S --noconfirm netbeans
yay -S --noconfirm payara
sudo wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.48/mysql-connector-java-5.1.48.jar -P /opt/payara5/glassfish/lib/
sudo chown -R $USER /opt/payara5/

#---------- Eclipse IDE ---------------------
sudo pacman -S --noconfirm eclipse-java
sudo pacman -S --noconfirm eclipse-jee

#------------------ Android Studio -----------------------
yay -S --noconfirm android-studio
#-----SDK Tools-----
#Android SDK Command-line Tools (necessary)

#---------- Nvidia Libraries -----------------
sudo pacman -S --noconfirm mhwd mhwd-nvidia
sudo mhwd -i pci video-nvidia
sudo pacman -S --noconfirm cuda cudnn python-tensorflow-opt-cuda

#---------- Intellij IDE Ultimate --------------------
#yay -S --noconfirm intellij-idea-ultimate-edition

#---------- Intellij IDE Comunity -----------------
#sudo pacman -S --noconfirm intellij-idea-community-edition

#----------- Ollama -----------------------
curl -fsSL https://ollama.com/install.sh | sh


########################################################################################

#################################### Android Environment ###################################

#----------------- Flutter ----------------- 
#yay -S --noconfirm flutter
#sudo groupadd flutterusers
#sudo gpasswd -a $USER flutterusers
#sudo chown -R :flutterusers /opt/flutter
#sudo chmod -R g+w /opt/flutter
#flutter doctor --android-licenses

########################################################################################
