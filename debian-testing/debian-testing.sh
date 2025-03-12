#-------------------- Update OS  --------------------
sudo apt update -y
sudo apt full-upgrade -y
sudo apt install -y software-properties-common apt-transport-https ca-certificates curl wget gpg lsb-release build-essential gcc build-essential dkms

#-------- Terminal zsh --------------
sudo apt-get install -y zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
sudo chsh -s $(which zsh) root
sudo chsh -s $(which zsh) $USER
#zsh

#------google chrome -------
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null
echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable

#-------------------- Google Chrome-------------------- 
wget -qO - https://dl.google.com/linux/linux_signing_key.pub | sudo tee /usr/share/keyrings/google-chrome.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable

#------ brave browser -------
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

#--------------------- Sublime Text -------------------
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
sudo echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

#--------------------- Visual Studio Code -------------------
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt update
sudo apt -y install code
sh ../vscode/vscode-extensions.sh

#--------------------- Docker -------------------------
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
#   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  bookworm stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

#---------------- Filezilla -----------------------------
sudo apt-get install -y filezilla

#----------- Screenshot ---------------------
sudo apt-get install -y flameshot

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

#------------ comando (tree) ----------------------------
sudo apt-get install -y tree

#--------------------- Wireguard ---------------------------
sudo apt install -y wireguard

#---------------------- JDK ------------------------------
sudo apt-get install -y openjdk-11-jdk openjdk-11-jre
sudo apt-get install -y default-jdk default-jre

#---------------- Maven ---------------------------------
sudo apt-get install -y maven

#------------ nvm ------------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install node

cat /proc/sys/fs/inotify/max_user_watches
# sudo sysctl fs.inotify.max_user_watches=65535
# cat /usr/lib/sysctl.d/10-manjaro.conf
sudo sysctl -p
# echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf

#React JS
npm i -g create-react-app
#Angular JS
npm install -g @angular/cli
#Vue JS
npm install -g @vue/cli
npm install -g create-nuxt-app
#TypeScript
npm i -g typescript
#Sass
npm install -g sass
#eslint
npm i -g eslint

#----------- Yarn -----------------------
npm install --global yarn

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
sudo systemctl stop apache2
sudo systemctl disable apache2
sudo apt-get install -y nginx
sudo chown -R $USER:www-data /var/www/html
sudo usermod -a -G www-data $USER
sudo chmod -R 777 /var/www/html
sudo systemctl reload nginx

#--------------------------- PHP --------------------------------
sudo rm -r /etc/apt/sources.list.d/php.list
sudo apt-get update
sudo apt-get -y install lsb-release ca-certificates curl
sudo curl -sSLo /tmp/debsuryorg-archive-keyring.deb https://packages.sury.org/debsuryorg-archive-keyring.deb
sudo dpkg -i /tmp/debsuryorg-archive-keyring.deb
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ bookworm main" > /etc/apt/sources.list.d/php-bookworm.list'
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ bullseye main" > /etc/apt/sources.list.d/php-bullseye.list'
# sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
sudo apt-get update

# default
sudo apt-get install -y php php-cli php-phpdbg php-fpm php-cgi libphp-embed \
libapache2-mod-php php-common php-gd php-mysql php-pgsql php-curl php-intl \
php-mbstring php-bcmath php-imap php-xml php-zip php-bz2 php-bcmath php-memcached \
php-ldap php-pspell php-readline php-dba php-dev php-redis

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

#--------------------- Postman ------------------------
sudo snap install slack --classic

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