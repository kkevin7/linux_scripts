#------- Actualizar Manjaro --------
sudo pacman-mirrors -g
sudo pacman -Syyu

#------- Packetes de compilacion de sistema --------
sudo pacman -S base-devel 

#------- yaourt ------------
sudo pacman -S yaourt

#------- gedit -------------
sudo pacman -S gedit

#------- Sublime Text -------------
yaourt -S sublime-text-dev

#-------- UnRAR ----------------
yaourt -S unrar

#--------- WPS -----------------
#yaourt -S wps-office

#--------- WPS diccionario espanyol ------
#yaourt -S wps-office-extension-spanish-dictionary

#--------- nslookup ---------------
sudo pacman -S dnsutils

#--------- Mplayer -----------------
yaourt -S mplayer

#------------------ Libre Office -------------------------
sudo pacman -S libreoffice-fresh libreoffice-fresh-es