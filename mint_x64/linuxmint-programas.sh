#----------- Google chrome ---------------
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/chrome.list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-get update
apt-get install -y google-chrome-stable

#--------- gedit -----
apt-get update
apt-get install -y gedit

#---------- sublime Text ------------
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

#------------ kvm ---------
apt-get install -y qemu-kvm qemu-utils libvirt-bin bridge-utils virt-manager
apt-get install -y python-spice-client-gtk virt-viewer
apt-get install -y gir1.2-spice-client-gtk-3.0
#apt-get install -y qemu-kvm libvirt-bin
usermod -a $(id -un) -G kvm
usermod -a $(id -un) -G libvirt

#------------ docker linux mint -----------
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo deb https://apt.dockerproject.org/repo ubuntu-xenial main >> /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) -y
sudo apt-get install docker-engine cgroup-lite apparmor -y
sudo usermod -a -G docker $USER
sudo systemctl start docker
#sudo systemctl status docker
sudo systemctl enable docker
sudo usermod -a -G docker $(id -un)


#------------ docker-compose ----------------
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#----------    bind9----------
apt-get install -y bind9

#---------- tcpdump -----------
apt-get install -y tcpdump

#---------- dnsutils -----------
apt-get install -y dnsutils

#---------- ClipGrab -------------
sudo add-apt-repository ppa:clipgrab-team/ppa
sudo apt-get update
sudo apt-get install clipgrab
