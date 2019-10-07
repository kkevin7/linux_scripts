#------------ GNS3 paquetes ------------------
sudo pacman -S --noconfirm gcc libelf libpcap cmake
sudo pacman -S --noconfirm bison flex git 
yaourt -S --noconfirm dynamips
sudo pacman -S --noconfirm subversion
sudo pacman -S --noconfirm iniparser
yaourt -S --noconfirm iouyap
yaourt -S --noconfirm ubridge
yaourt -S --noconfirm vboxwrapper
sudo pacman -S --noconfirm samba
sudo pacman -S --noconfirm qemu
sudo pacman -S --noconfirm libvirt
#yaourt --m-arg "--skipchecksums" -S --noconfirm gns3-server
#yaourt -S --noconfirm gns3-gui

#------------ GNS3 python ---------------------
sudo pacman -S --noconfirm python-pip wget git
sudo pacman -S --noconfirm python-pyqt5 qt5-tools qt5-multimedia
sudo pacman -S --noconfirm python-pyqt5 qt5-tools qt5-multimedia python-pyzmq
sudo pip install --upgrade pip
sudo pip install -U tornado ws4py setuptools netifaces zmq dev
sudo pip install -U ws4py 
sudo pip install pyqt5

#-------- Paquetes necesarios Python 3.6 --------------------
yaourt -S --noconfirm python36
#instalar pip para python3.6
mkdir -p /tmp/pip36
cd /tmp/pip36
wget https://bootstrap.pypa.io/get-pip.py
sudo python3.6 get-pip.py
sudo rm -R -f /tmp/pip36
cd $HOME
#instalar libreria de python3.6
pacman -S --noconfirm python-yarl
sudo pip3.6 install yarl
sudo pip3.6 install setuptools
sudo pip3.6 install jsonschema

#----------- VARIABLES DE ENTORNO ------------------------
branch=v2.1.9

#------------ GNS3 GUI -------------------------
mkdir -p /tmp/gns3
cd /tmp/gns3 
git clone --branch $branch https://github.com/GNS3/gns3-gui.git
cd gns3-gui
sudo python setup.py install 
sudo rm -R -f /tmp/gns3/gns3-gui
cd $HOME

#------------ GNS3 Server ----------------------
mkdir -p /tmp/gns3
cd /tmp/gns3 
git clone --branch $branch https://github.com/GNS3/gns3-server.git
cd gns3-server
sudo python3.6 setup.py install 
sudo rm -R -f /tmp/gns3/gns3-server
cd $HOME

#----------- Crear Enlace para abrir aplicacion ---------------
cd /usr/share/
sudo wget https://www.gns3.com/assets/images/logo-colour.png
cd $HOME
sudo echo -e "[Desktop Entry]
Type=Application
Version=2.1.9
Name=GNS3
Comment=GNS3 network simulator
Exec=gns3 %f
#Icon=gns3
Icon=/usr/share/logo-colour.png 
Terminal=false
Categories=Network;Education;
MimeType=application/x-gns3;
Keywords=simulator;network;netsim;" > /usr/share/applications/gns3.desktop
cd $HOME

#------------ GNS3 dynamips* -----------------------
cd /tmp
git clone git://github.com/GNS3/dynamips.git
cd dynamips
mkdir build
cd build
cmake ..
make
sudo make install
sudo setcap cap_net_admin,cap_net_raw=ep $(which dynamips) 
sudo rm -R -f /tmp/dynamips
cd $HOME

#------------ GNS3 initparser -----------------------
cd /tmp
git clone http://github.com/ndevilla/iniparser.git
cd iniparser
make
sudo cp libiniparser.* /usr/lib/
sudo cp src/iniparser.h /usr/local/include
sudo cp src/dictionary.h /usr/local/include
sudo rm -R -f /tmp/iniparser
cd $HOME

#-------- GNS3 file iouyap ------------------
cd /tmp
git clone https://github.com/GNS3/iouyap.git
cd iouyap
make
sudo make install
sudo rm -R -f /tmp/iouyap
cd $HOME

#-------- GNS3 file ubridge ------------------
cd /tmp
git clone https://github.com/GNS3/ubridge.git
cd ubridge
make
sudo make install
sudo rm -R -f /tmp/ubridge
cd $HOME

#--------- GNS3 file vpcs (suele dar error) -------------------
cd /tmp
git clone https://github.com/GNS3/vpcs.git
cd vpcs/src
sh mk.sh
sudo cp -R vpcs /usr/local/bin/
chmod +x /usr/local/bin/vpcs
sudo rm -R -f /tmp/vpcs
cd $HOME


#-------- DESINSTALAR ARCHIVOS -------------
#sudo python setup.py install --record files.txt
#cat files.txt | sudo xargs rm -rf