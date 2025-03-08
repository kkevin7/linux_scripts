#-------------------- Debian Repositories  --------------------
sudo cp -fr ./repositories/debian12/sources.list /etc/apt/sources.list

#-------------------- Debian Grub configuration  --------------------
sudo cp -r /etc/default/grub /etc/default/grub.bak
sudo cp -fr ./grub /etc/default/grub

#-------------------- Update OS  --------------------
sudo apt-get update
sudo apt-get install -y software-properties-common apt-transport-https ca-certificates curl gnupg lsb-release

#-------------------- Sudo ---------------------------
apt-get install -y sudo
#sudo adduser $USER sudo
sudo usermod -a -G sudo $USER

#-------------------- Nvidia -----------------------------------
#sudo apt-get install -y linux-headers-$(uname -r) build-essential libglvnd-dev pkg-config
sudo apt update && sudo apt install -y nvidia-detect
sudo nvidia-detect
sudo apt-get install -y nvidia-driver

#-------------------- Build Commands ------------------
sudo apt-get install -y build-essential gettext sassc

#--------------------- git ---------------------------
sudo apt-get install -y git
git config --global core.editor "code"

#-------- Terminal zsh --------------
sudo apt-get install -y zsh

#-------------------- Google Chrome-------------------- 
wget -qO - https://dl.google.com/linux/linux_signing_key.pub | sudo tee /usr/share/keyrings/google-chrome.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable

#--------------------- Sublime Text -------------------
sudo rm -r /etc/apt/sources.list.d/sublime-text.list
sudo apt-get install -y apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

#--------------------- Visual Studio Code -------------------
sudo rm -r /etc/apt/sources.list.d/vscode.list
sudo apt-get install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt-get update
sudo apt-get install -y code

#Extensions
sh ../vscode/vscode-extensions.sh

#--------------------- Docker -------------------------
sudo rm -r /etc/apt/sources.list.d/docker.list

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
# sudo newgrp docker
#---------------------- JDK ------------------------------
#sudo apt-get install -y openjdk-8-jdk openjdk-8-jre
#sudo apt-get install -y openjdk-11-jdk openjdk-11-jre
sudo apt-get install -y default-jdk default-jre

#---------------------- VLC ---------------------------
sudo apt-get install -y vlc

#---------------------- Gparted ---------------------------
sudo apt-get install -y gparted

#---------------------- qbittorrent ------------------------
sudo apt-get install -y qbittorrent

#----------------------- GIMP ------------------------------
sudo apt-get install -y gimp 

#------------ UnRAR o RAR --------------------------------------
sudo apt-get install -y unrar

#----------- htop (ver procesos) ---------------------
sudo apt-get install -y htop

#----------- Screenshot ---------------------
sudo apt-get install -y flameshot

#------------ comando (tree) ----------------------------
sudo apt-get install -y tree

#---------------- Maven ---------------------------------
sudo apt-get install -y maven

#---------------- Filezilla -----------------------------
sudo apt-get install -y filezilla

#------------ NodeJS --------------------
cd /tmp
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile

sudo apt-get install -y nodejs
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

#--------------------------- Yarn ------------------------------
sudo apt-get install -y yarn

#--------------------------- Apache -----------------------------
sudo apt-get install -y apache2
sudo chown -R $USER:www-data /var/www/html
sudo usermod -a -G www-data $USER
sudo chmod -R 777 /var/www/html
sudo a2dissite 000-default.conf

#Enable Modules for Apache
sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_balancer
sudo a2enmod lbmethod_byrequests
sudo a2enmod headers
sudo systemctl restart apache2

#--------------------------- NGINX -----------------------------
sudo systemctl disable apache2
sudo apt-get install -y nginx
sudo chown -R $USER:www-data /var/www/html
sudo usermod -a -G www-data $USER
sudo chmod -R 777 /var/www/html
sudo systemctl reload nginx

#--------------------------- PHP --------------------------------
sudo rm -r /etc/apt/sources.list.d/php.list
sudo apt install apt-transport-https lsb-release ca-certificates wget -y
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg 
sudo sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
sudo apt update

# php 8.2
sudo apt-get install -y php8.2 php8.2-cli php8.2-phpdbg php8.2-fpm php8.2-cgi libphp8.2-embed \
libapache2-mod-php8.2 php8.2-common php8.2-gd php8.2-mysql php8.2-pgsql php8.2-curl php8.2-intl \
php8.2-mbstring php8.2-bcmath php8.2-imap php8.2-xml php8.2-zip php8.2-bz2 php8.2-bcmath php8.2-memcached \
php8.2-ldap php8.2-pspell php8.2-readline php8.2-dba php8.2-dev php8.2-redis

# php 8.1
sudo apt-get install -y php8.1 php8.1-cli php8.1-phpdbg php8.1-fpm php8.1-cgi libphp8.1-embed \
libapache2-mod-php8.1 php8.1-common php8.1-gd php8.1-mysql php8.1-pgsql php8.1-curl php8.1-intl \
php8.1-mbstring php8.1-bcmath php8.1-imap php8.1-xml php8.1-zip php8.1-bz2 php8.1-bcmath php8.1-memcached \
php8.1-ldap php8.1-pspell php8.1-readline php8.1-dba php8.1-dev php8.1-redis

# php 7.4
sudo apt-get install -y php7.4 php7.4-cli php7.4-phpdbg php7.4-fpm php7.4-cgi libphp7.4-embed \
libapache2-mod-php7.4 php7.4-common php7.4-gd php7.4-mysql php7.4-pgsql php7.4-curl php7.4-intl \
php7.4-mbstring php7.4-bcmath php7.4-imap php7.4-xml php7.4-zip php7.4-bz2 php7.4-bcmath php7.4-memcached \
php7.4-ldap php7.4-pspell php7.4-readline php7.4-dba php7.4-dev php7.4-redis

# Switch php version
# sudo update-alternatives --config php
# update-alternatives --set php /usr/bin/php8.2

#--------------------------- PHP Debuger --------------------------------
sudo apt-get install -y php-xdebug
sudo echo "zend_extension=xdebug.so
xdebug.remote_autostart = 1
xdebug.remote_enable = 1
xdebug.remote_handler = dbgp
xdebug.remote_host = 127.0.0.1
xdebug.remote_log = /tmp/xdebug_remote.log
xdebug.mode = debug
xdebug.start_with_request = yes
xdebug.remote_port = 9003
" | sudo tee /etc/php/7.4/mods-available/xdebug.ini 
sudo systemctl restart apache2

#--------------------------- PHP Composer --------------------------------
wget -qO - https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin/ --filename=composer

#--------------------------- Laravel -------------------------------------
composer global require laravel/installer
export PATH=~/.config/composer/vendor/bin:$PATH
echo 'export PATH=~/.config/composer/vendor/bin:$PATH' >> /home/${USER}/.bashrc
source ~/.bashrc

#---------------------- Wireshark ----------------------------------
sudo apt-get install -y wireshark
sudo groupadd wireshark
sudo usermod -a -G wireshark $USER
sudo chgrp $(id -un) /usr/bin/dumpcap
sudo chmod +x /usr/bin/dumpcap
sudo setcap cap_net_raw,cap_net_admin+eip /usr/bin/dumpcap

#--------------------- WireGuard -----------------------------------
sudo apt install -y wireguard

#--------------------- Snap -----------------------------------
sudo apt-get install -y snapd
sudo snap install core
sudo systemctl enable snapd

#--------------------- Postman ------------------------
sudo snap install postman --classic

#--------------------- Mysql Workbeanch ------------------------
sudo snap install mysql-workbench-community --classic

#--------------------- Jdownloader ------------------------
sudo snap install jdownloader2 --classic

#--------------------- Datagrid ---------------------------
sudo snap install datagrip --classic

#--------------------- Apache Netbeans ---------------------------
sudo snap install netbeans --classic

#--------------------- Android Studio ---------------------------
sudo snap install android-studio --classic

#--------------------- Datagrid ---------------------------
#sudo snap install slack --classic
# wget https://downloads.slack-edge.com/releases/linux/4.33.90/prod/x64/slack-desktop-4.33.90-amd64.deb
# sudo apt install ./slack-desktop-*.deb

#--------------------- Papirus Icons --------------------------
# sudo rm -r /etc/apt/sources.list.d/papirus-ppa.list
# sudo sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu jammy main' > /etc/apt/sources.list.d/papirus-ppa.list"
# sudo wget -qO /etc/apt/trusted.gpg.d/papirus-ppa.asc 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9461999446FAF0DF770BFC9AE58A9D36647CAE7F'
# sudo apt-get update
# sudo apt-get install -y papirus-icon-theme
