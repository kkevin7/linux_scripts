
#-------------------- Update OS  --------------------
sudo apt-get update
sudo apt-get install -y software-properties-common apt-transport-https ca-certificates curl gnupg lsb-release

#-------------------- Sudo ---------------------------
apt-get install -y sudo
#sudo adduser $USER sudo
sudo usermod -a -G sudo $USER

#-------------------- Build Commands ------------------
sudo apt-get install -y build-essential gettext sassc

#--------------------- git ---------------------------
sudo apt-get install -y git
git config --global user.name "Kevin Martinez"
git config --global user.email "kkevinmartinez7@gmail.com"
git config --global core.editor "code"

#-------- Terminal zsh --------------
sudo apt-get install -y zsh

#-------------------- Google Chrome-------------------- 
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install -y google-chrome-stable

#--------------------- Sublime Text -------------------
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
sudo echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

#--------------------- Visual Studio Code -------------------
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/visual-studio-code.list
sudo apt-get update
sudo apt-get install -y code

#--------------------- Docker -------------------------
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

#---------------------- Docker Compose ------------------
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#---------------------- JDK ------------------------------
#sudo apt-get install -y openjdk-8-jdk openjdk-8-jre
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

#------------ NodeJS --------------------
cd /tmp
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
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
sudo chgrp -R www-data /var/www/html
sudo chmod -R 777 /var/www/html

#--------------------------- PHP --------------------------------
sudo apt-get install -y curl unzip 
sudo apt-get install -y libapache2-mod-php php php-cli php-common php-gd php-mysql php-pgsql \
php-curl php-intl php-mbstring php-bcmath php-imap php-xml php-zip php-bz2 php-json \
php-tokenizer php-bcmath php-cgi php-pspell php-readline php-dba php-dev libmcrypt-dev php-pear
#nano /etc/php/7.4/apache2/php.ini
#nano /etc/apache2/apache2.conf
#cd /var/www/html
#chgrp -R www-data /var/www/html/your-project
#chmod -R 775 storage/ bootstrap/cache/

#--------------------------- PHP Debuger --------------------------------
sudo apt-get install php-xdebug
sudo echo "zend_extension=xdebug.so
xdebug.remote_autostart = 1
xdebug.remote_enable = 1
xdebug.remote_handler = dbgp
xdebug.remote_host = 127.0.0.1
xdebug.remote_log = /tmp/xdebug_remote.log
xdebug.remote_mode = req
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

#-------------------- Mysql Workbeach ------------------------------
#export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
#echo 'export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin' >> /home/${USER}/.bashrc

#-------------------- NVidia -----------------------------------
sudo apt-get install -y linux-headers-$(uname -r) build-essential libglvnd-dev pkg-config
sudo apt-get install -y nvidia-detect
sudo apt-get install -y nvidia-driver

#--------------------- Tweets Configs --------------------------
sudo apt-get install -y gnome-shell-extension-dashtodock 

#--------------------- Dash to dock ------------------
#cd /tmp
#git clone https://github.com/ewlsh/dash-to-dock/
#cd dash-to-dock
#git checkout ewlsh/gnome-40
#make
#make install

#------------ Suspencion -----------------
#sudo apt-get install molly-guard
#sudo apt-get install pm-utils