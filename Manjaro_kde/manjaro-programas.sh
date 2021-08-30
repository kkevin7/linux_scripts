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

#--------Actualizar yay----------
#yay -Syyu --noconfirm --devel --aur
yay -Syua --noconfirm

#-------- Terminal zsh --------------
sudo pacman -S --noconfirm zsh

#-------- Kernel 4.14 Linux ---------
#sudo mhwd-kernel -i linux414
#sudo update-grub
#sudo pacman -R --noconfirm linux414 linux414-headers linux414-extramodules

#------ gedit editor text---------------
sudo pacman -S --noconfirm gedit
 
#------- google chrome (fakeroot) ------------------ 
yay -S --noconfirm google-chrome
#sudo pacman -S --noconfirm chromium 

#------- Sublime Text ---------------
yay -S --noconfirm sublime-text-dev

#------- Visual Studio Code -------------
yay -S --noconfirm visual-studio-code-bin
#---extensions---
code --install-extension thekalinga.bootstrap4-vscode
code --install-extension lihui.vs-color-picker
code --install-extension vincaslt.highlight-matching-tag
code --install-extension Zignd.html-css-class-completion
code --install-extension felixfbecker.php-intellisense
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension cliffordfajardo.hightlight-selections-vscode
code --install-extension HookyQR.beautify
code --install-extension Prisma.vscode-graphql
code --install-extension kumar-harsh.graphql-for-vscode
code --install-extension esbenp.prettier-vscode
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension christian-kohler.path-intellisense
code --install-extension SetiawanJodi.myci-extension
code --install-extension small.php-ci
code --install-extension wayou.vscode-todo-highlight
code --install-extension alefragnani.bookmarks
#Normal
code --install-extension Tyriar.lorem-ipsum
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension wakatime.vscode-wakatime
code --install-extension alefragnani.project-manager
#Syntaxis
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension naumovs.color-highlight
code --install-extension mikestead.dotenv
code --install-extension editorconfig.editorconfig
#Theme
code --install-extension equinusocio.vsc-material-theme
code --install-extension whizkydee.material-palenight-theme
#HTML
code --install-extension ecmel.vscode-html-css
code --install-extension abusaidm.html-snippets
#Javascript
code --install-extension xabikos.javascriptsnippets
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension sburg.vscode-javascript-booster
code --install-extension jmsv.javascriptsnippetsstandard
code --install-extension capaj.vscode-standardjs-snippets
#npm
code --install-extension christian-kohler.npm-intellisense
#React
code --install-extension burkeholland.simple-react-snippets
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension EQuimper.react-native-react-redux
code --install-extension xabikos.ReactSnippets
code --install-extension joshjg.generate-react-component
#React Native
code --install-extension ofhumanbondage.react-proptypes-intellisense
code --install-extension msjsdiag.vscode-react-native
code --install-extension steoates.autoimport
#Angular
code --install-extension johnpapa.angular2
code --install-extension mikael.angular-beastcode
code --install-extension angular.ng-template
#Vue
code --install-extension octref.vetur
code --install-extension hollowtree.vue-snippets
code --install-extension sdras.vue-vscode-snippets
code --install-extension dariofuzinato.vue-peek
#TypeScript
code --install-extension kevinmcgowan.typescriptimport
#Flutter
code --install-extension Nash.awesome-flutter-snippets
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
code --install-extension quicktype.quicktype
code --install-extension formulahendry.terminal
#Python
code --install-extension ms-python.python
code --install-extension tht13.python
code --install-extension donjayamanne.python-extension-pack
code --install-extension tushortz.python-extended-snippets
code --install-extension kevinrose.vsc-python-indent
code --install-extension almenon.arepl
code --install-extension dongli.python-preview
#Laravel 
code --install-extension ryannaddy.laravel-artisan
code --install-extension codingyu.laravel-goto-view
code --install-extension cjhowe7.laravel-blade
code --install-extension onecentlin.laravel5-snippets
code --install-extension amirmarmul.laravel-blade-vscode
code --install-extension onecentlin.laravel-blade
code --install-extension kokororin.vscode-phpfmt
code --install-extension amiralizadeh9480.laravel-extra-intellisense
code --install-extension onecentlin.laravel-extension-pack
#Firebase
code --install-extension toba.vsfire
#Icons
code --install-extension vscode-icons-team.vscode-icons
code --install-extension PKief.material-icon-theme
#Theme
code --install-extension fabiospampinato.vscode-monokai-night
#Windows
code --install-extension ms-vscode-remote.remote-ws
#Git
code --install-extension donjayamanne.githistory
code --install-extension waderyan.gitblame
code --install-extension codezombiech.gitignore
#Sass
code --install-extension syler.sass-indented
#Tailwindcss
code --install-extension bradlc.vscode-tailwindcss
#Docker
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools

#python
#pip install -U black

#------------ git ---------------------------
git config --global user.name "Kevin Martinez"
git config --global user.email "kkevinmartinez7@gmail.com"
git config --global core.editor "nano"

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

#-------- Java OpenJDK8 ------------------------
sudo pacman -S --noconfirm jdk8-openjdk
sudo pacman -S --noconfirm jdk11-openjdk
sudo pacman -S --noconfirm jdk-openjdk
sudo archlinux-java set java-11-openjdk

#---------- Netbeans -----------------
sudo pacman -S --noconfirm netbeans
yay -S --noconfirm payara
sudo wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.48/mysql-connector-java-5.1.48.jar -P /opt/payara5/glassfish/lib/
sudo chown -R $USER /opt/payara5/

#---------- Eclipse IDE ---------------------
#sudo pacman -S --noconfirm eclipse-java
#sudo pacman -S --noconfirm eclipse-jee

#------------------ Android Studio -----------------------
yay -S --noconfirm android-studio
#-----SDK Tools-----
#Android SDK Command-line Tools (necessary)

#----------------- Flutter ----------------- 
yay -S --noconfirm flutter
sudo groupadd flutterusers
sudo gpasswd -a $USER flutterusers
sudo chown -R :flutterusers /opt/flutter
sudo chmod -R g+w /opt/flutter
newgrp flutterusers
#flutter doctor --android-licenses

#---------- Web Storm -----------------------------
#yay -S --noconfirm webstorm
#yay -S --noconfirm phpstrom

#---------- Intellij IDE Ultimate --------------------
#yay -S --noconfirm intellij-idea-ultimate-edition

#---------- Intellij IDE Comunity -----------------
#sudo pacman -S --noconfirm intellij-idea-community-edition

#------------------- QT Creator ----------------------
#sudo pacman -S --noconfirm qtcreator
#libs
#yay -S --noconfirm qt5-websockets

#----------------- WPS Office ----------------------------
#yay -S --noconfirm wps-office
#yay -S --noconfirm wps-office-extension-spanish-dictionary
#yay -S wps-office-mui-es-mx --noconfirm

#------------------ Libre Office -------------------------
sudo pacman -S --noconfirm libreoffice-fresh-es
sudo pacman -S --noconfirm hunspell-es_sv hyphen-es mythes-es

#------------------ Microsoft Office onlie -----------------
sudo pacman -S --noconfirm ms-office-online

#------------------- Etcher (Boot USB) ---------------------
#sudo pacman -S --noconfirm etcher

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

#---------- pinta (editor de imagen)-------------------------
#sudo pacman -S --noconfirm Pinta

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

#----------- Pgadmin Postgres-----------------------------
#sudo pacman -S --noconfirm pgadmin3
#sudo pacman -S --noconfirm pgadmin4

#----------- PgModeler Postgres --------------------------
#yay -S --noconfirm pgmodeler

#------------ Foxit Reader -----------------------
yay -S --noconfirm foxitreader

#------------ Adobe Acrobat Reader -----------------------
#yay -S --noconfirm acroread

#----------- Reproductor vlc ----------------------
sudo pacman -S --noconfirm vlc

#------------ Gimp ----------------------
#sudo pacman -S --noconfirm gimp


#------------ Apache & PHP ------------------
sudo pacman -Sy --noconfirm php-apache php7.4 php-cgi php-fpm php-gd  php-embed php-intl php-imap  php-redis php-snmp
sudo systemctl enable httpd
sudo systemctl restart httpd

#Docs
#https://forum.manjaro.org/t/howto-install-apache-mariadb-mysql-php-lamp/13000
#https://diarioprogramador.com/como-instalar-el-stack-lamp-en-manjaro-linux/
#https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-arch-linux

#------------------ Composer ------------------
sudo pacman -S --noconfirm composer

#------------------ Laravel ------------------
composer global require laravel/installer
echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ~/.bashrc
source ~/.bashrc

#------------ NodeJS --------------------
sudo pacman -S --noconfirm nodejs npm
#React
sudo npm i -g create-react-app
#Angular
sudo npm install -g @angular/cli
#TypeScript
sudo npm i -g typescript
#Sass
sudo npm install -g sass
#eslint
sudo npm i -g eslint

#------------ Yarn ------------------------------
sudo pacman -S --noconfirm yarn


#----------- Robo 3T for MongoDB -----------------------
yay -S --noconfirm robo3t-bin 


#----------- Whatsapp Desktop ---------------------
sudo pacman -S --noconfirm whatsapp-for-linux


#----------- Filezilla --------------------------
sudo pacman -S --noconfirm filezilla


#----------- Virtualbox -----------------------------
sudo pacman -S --noconfirm virtualbox virtualbox-guest-iso 
sudo pacman -S --noconfirm $(pacman -Qsq "^linux" | grep "^linux[0-9]*[-rt]*$" | awk '{print $1"-virtualbox-host-modules"}' ORS=' ') 
#sudo pacman -S --noconfirm linux419-virtualbox-host-modules
sudo gpasswd -a $USER vboxusers
sudo modprobe vboxdrv
sudo vboxmanage hostonlyif create

#------------ Virt-manager (KVM) ---------------
sudo pacman -S --noconfirm inxi dmidecode gparted && sudo inxi -Fxm
sudo pacman -S --noconfirm virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat
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


################  ICONOS #############################

#----------- Papirus -----------------------------
#yay -Sy --noconfirm papirus-icon-theme-git


#################### OTROS #########################

#----------- XAMPP PHP ----------------------
#yay -S --noconfirm xampp

#--------- Brackets (fakeroot)------------------ 
#yay -S --noconfirm brackets

#------------------ Lectores PDF (foxit fakeroot)--------------------------
#yay -S --noconfirm foxitreader
#sudo pacman -S --noconfirm okular

#----------- viewnior (visualizador de imagenes) -----------
#sudo pacman -S --noconfirm viewnior

#----------- covertidor de images a pdf consola ----------------
#sudo pacman -S --noconfirm imagemagick

#----------- Imagen a texto ---------------
#sudo pacman -S ocrfeeder
#yay -S tesseract 

#------------ UNetbootin ---------------------
#yay -S --noconfirm unetbootin

#------------ Cligrab --------------------------
#yay -S --noconfirm clipgrab-qt5


