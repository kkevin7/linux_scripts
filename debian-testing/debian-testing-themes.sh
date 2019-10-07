
#---------------------------- TEMAS -----------------------------------------------

#Tema GTK Arc
#apt update && \
apt install arc-theme && \

#Tema Adapta
apt-add-repository ppa:tista/adapta && \
apt-get update && \
apt-get install adapta-gtk-theme && \

#Tema Numix
add-apt-repository ppa:numix/ppa && \
apt-get update && \
apt-get install numix-gtk-theme && \
apt-get install numix-icon-theme-circle && \

#--------------------------- ICONOS ----------------------------------------------

#Papirus Icon Theme
#apt-get  purge papirus-icon-theme && \
#apt-get  clean && apt-get autoclean && apt-get autoremove && \
#apt-get  update && \
apt-get install papirus-icon-theme && \


#---------------------------- LOGIN ------------------------------------------------

#Tema breeze-kde-sddm
apt-get update && \
apt-get install sddm-theme-breeze

