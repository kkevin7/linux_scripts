#Unity Tweak
apt-get install -y unity-tweak-tool 
#apt-get install -y gnome-tweak-tool 

#----------------------------TEMAS--------------------------------------------------------

# Tema Adapta 
sudo apt-add-repository ppa:tista/adapta -y
sudo apt update
sudo apt install adapta-gtk-theme

# tema  Numix
add-apt-repository ppa:numix/ppa 
apt-get update 
apt-get install -y numix-gtk-theme 
apt-get install -y numix-icon-theme-circle

#tema Arc ------- el mejor -------------
add-apt-repository ppa:varlesh-l/papirus-pack 
apt-get update 
apt-get install -y arc-theme



# -------------------------- ICONOS -------------------------------------------------

#iconos Papel
add-apt-repository ppa:snwh/pulp
apt-get update
apt-get install paper-icon-theme

#iconos uniforme
add-apt-repository ppa:noobslab/icons2
apt-get update
apt-get install uniform-icon