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
yay -S --noconfirm sublime-text-4

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
code --install-extension christian-kohler.path-intellisense
code --install-extension SetiawanJodi.myci-extension
code --install-extension small.php-ci
code --install-extension wayou.vscode-todo-highlight
code --install-extension alefragnani.bookmarks
code --install-extension ritwickdey.liveserver
code --install-extension whosydd.stylelint-config
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-vscode-remote.remote-containers
code --install-extension github.vscode-pull-request-github
#Normal
code --install-extension Tyriar.lorem-ipsum
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension wakatime.vscode-wakatime
code --install-extension alefragnani.project-manager
code --install-extension bierner.emojisense
#Syntaxis
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension naumovs.color-highlight
code --install-extension mikestead.dotenv
code --install-extension editorconfig.editorconfig
#Theme
code --install-extension equinusocio.vsc-material-theme
code --install-extension whizkydee.material-palenight-theme
#GIT
code --install-extension eamodio.gitlens
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
code --install-extension arunagiritm.material-ui
#Angular
code --install-extension johnpapa.angular2
code --install-extension mikael.angular-beastcode
code --install-extension angular.ng-template
#Vue
code --install-extension jcbuisson.vue
code --install-extension octref.vetur
code --install-extension hollowtree.vue-snippets
code --install-extension sdras.vue-vscode-snippets
code --install-extension dariofuzinato.vue-peek
code --install-extension vuetifyjs.vuetify-vscode
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
#XML
code --install-extension dotjoshjohnson.xml
code --install-extension redhat.vscode-xml
#NodeJS
code --install-extension module-intellisense
code --install-extension abdoseadaa.node-js-snippet

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
#flutter doctor --android-licenses

#---------- Web Storm -----------------------------
#yay -S --noconfirm webstorm
#yay -S --noconfirm phpstrom

#---------- Intellij IDE Ultimate --------------------
#yay -S --noconfirm intellij-idea-ultimate-edition

#---------- Intellij IDE Comunity -----------------
#sudo pacman -S --noconfirm intellij-idea-community-edition

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
yay -S gnome-keyring

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
sudo pacman -S --noconfirm php7 php7-apache php7-cgi php7-mongodb php7-fpm php7-embed php7-intl php7-imap php7-gd php7-redis php7-snmp php7-memcache php7-sqlite php7-pgsql php7-odbc
sudo pacman -S --noconfirm php php-apache php-cgi php-fpm php-gd php-embed php-intl php-imap php-redis php-snmp php-pgsql php-odbc
yay -S --noconfirm php-pdo_sqlsrv
sudo systemctl enable httpd
sudo systemctl restart httpd

#Modules
#sudo nano /etc/httpd/conf/httpd.conf

#------------------ Uncomment -----------------------
# LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
# LoadModule rewrite_module modules/mod_rewrite.so
# LoadModule ssl_module modules/mod_ssl.so
# LoadModule socache_shmcb_module modules/mod_socache_shmcb.so

#------------------ Comment --------------------------
# LoadModule mpm_event_module modules/mod_mpm_event.so
# LoadModule unique_id_module modules/mod_unique_id.so

# --------- Add the following lines at the bottom for php8: -----
# LoadModule php_module modules/libphp.so
# AddHandler php-script php
# Include conf/extra/php_module.conf

#pho.ini
# sudo nano /etc/php/php.ini

# extension=bz2
# extension=gd
# extension=iconv
# extension=mysqli
# extension=pdo_mysql
# extension=pdo_pgsql
# extension=pgsql

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
source ~/.zshrc
# echo "PATH=\"$HOME/.config/composer/vendor/bin:$PATH\"" >> ~/.zshrc
# source ~/.zshrc

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

#----------- Flameshot -----------------------
sudo pacman -S --noconfirm flameshot

#----------- Robo 3T for MongoDB -----------------------
yay -S --noconfirm robo3t-bin 

#----------- Slack desktop -----------------------
yay -S --noconfirm slack-desktop

#----------- Whatsapp Desktop ---------------------
sudo pacman -S --noconfirm whatsapp-for-linux

#----------- Filezilla --------------------------
sudo pacman -S --noconfirm filezilla

#----------- Jetbrains DataGrid --------------------------
yay -S --noconfirm datagrip

#----------- Redis -----------------------------
yay -S --noconfirm redis
sudo systemctl enable redis
sudo systemctl start redis

#----------- Supervisor -----------------------------
sudo pacman -S --noconfirm supervisor

#----------- Peek ---------------------------------
sudo pacman -S peek --noconfirm 

#----------- droidcam -----------------------------
sudo pacman -S --noconfirm "linux$(uname -r | awk -F. '{print $1$2}')-headers"
yay -S --noconfirm droidcam 

#----------- Virtualbox -----------------------------
sudo pacman -S --noconfirm virtualbox virtualbox-guest-iso $(pacman -Qsq "^linux" | grep "^linux[0-9]*[-rt]*$" | awk '{print $1"-virtualbox-host-modules"}' ORS=' ') 
yay -S --noconfirm virtualbox-ext-oracle
sudo gpasswd -a $USER vboxusers
sudo modprobe vboxdrv

#----------- Wireshark -------------------------------
sudo pacman -S --noconfirm wireshark-qt
sudo usermod -a -G wireshark $USER
sudo chmod +x /usr/bin/dumpcap

#----------- Apache BenchMark ------------------------
yay -S --noconfirm  httperf-git

#------------ Virt-manager (KVM) ---------------
# sudo pacman -S --noconfirm inxi dmidecode gparted && sudo inxi -Fxm
# sudo pacman -S --noconfirm virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat
# sudo systemctl enable libvirtd.service
# sudo systemctl start libvirtd.service
# sudo usermod -a -G kvm $(id -un)
# sudo usermod -a -G libvirt $(id -un)
# sudo virsh net-autostart default
# sudo virsh net-start default

#------------- Imagenes Docker -----------------------------}
#docker pull mariadb:latest 
#docker pull postgres:latest 
#docker pull debian:stretch
#docker pull payara/server-full 



#------------TEMAS MANJARO------------------------


#################### OTROS #########################

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


