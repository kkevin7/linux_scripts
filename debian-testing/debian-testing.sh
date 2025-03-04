#-------------------- Update OS  --------------------
sudo apt-get update
sudo apt-get install -y software-properties-common apt-transport-https ca-certificates curl wget gpg lsb-release build-essential gcc
sudo apt install build-essential dkms

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

#------ brave browser -------
sudo apt install curl
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
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#---------------------- Docker Compose ------------------
sudo apt -y install docker-compose

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
