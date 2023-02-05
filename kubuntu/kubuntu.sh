#-------------------- Update OS  --------------------
sudo apt-get update
sudo apt-get install -y software-properties-common apt-transport-https ca-certificates curl gnupg lsb-release

#-------- Terminal zsh --------------
sudo apt-get install -y zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
sudo chsh -s $(which zsh) root
sudo chsh -s $(which zsh) $USER
zsh

#------google chrome -------
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install -y google-chrome-stable

#--------------------- Sublime Text -------------------
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

#--------------------- Visual Studio Code -------------------
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt -y install code
sh ../vscode/vscode-extensions.sh

#--------------------- Docker -------------------------
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker $USER
sudo apt -y install docker-compose

#---------------------- Docker Compose ------------------
sudo apt -y install docker-compose

#---------------------- JDK ------------------------------
sudo apt-get install -y openjdk-11-jdk openjdk-11-jre
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
source ~/.zshrc
nvm install node
nvm install 16
nvm use 16
nvm run default --version

#React
npm i -g create-react-app
#Angular
npm install -g @angular/cli
#TypeScript
npm i -g typescript
#Sass
npm install -g sass
#eslint
npm i -g eslint

#--------------------------- Yarn ------------------------------
sudo apt-get install -y yarn

#--------------------------- PHP --------------------------------
sudo add-apt-repository ppa:ondrej/php -y
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

# set php version
# sudo update-alternatives --config php

#Change Configuration
sudo nano /etc/php/8.1/cli/php.ini
sudo nano /etc/php/8.1/apache2/php.ini

upload_max_filesize = 40M 
post_max_size = 48M 
memory_limit = 256M 
max_execution_time = 600 
max_input_vars = 3000 
max_input_time = 1000

#Enable PHP 8.1 for Apache
#sudo a2dismod php8.1
#sudo a2enmod php8.1

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

#--------------------------- PHP Composer --------------------------------
wget -qO - https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin/ --filename=composer

#--------------------------- Laravel -------------------------------------
composer global require laravel/installer
export PATH=~/.config/composer/vendor/bin:$PATH
echo 'export PATH=~/.config/composer/vendor/bin:$PATH' >> /home/${USER}/.bashrc
source ~/.bashrc

#------------ NodeJS --------------------
cd /tmp
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get update
sudo apt-get install -y nodejs

#----------- Yarn -----------------------
sudo apt remove yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install -y yarn

#------------ Certbot ---------------------
sudo apt-add-repository ppa:certbot/certbot -y
sudo apt-get update -y
sudo apt-get install -y certbot python3-certbot-apache

#---------- Redis --------------------
sudo apt install -y redis-server
sudo systemctl restart redis.service

#---------- Supervisor --------------------
sudo apt-get install -y supervisor
sudo touch /etc/supervisor/conf.d/palomarv2.conf

#--------------------- Snap -----------------------------------
sudo apt-get install -y snapd
sudo snap install core

#--------------------- Slack ---------------------------
sudo snap install slack --classic

#--------------------- Datagrid ---------------------------
sudo snap install datagrip --classic