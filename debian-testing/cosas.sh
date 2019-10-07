###Fuente https://salmorejogeek.com/2016/08/27/me-puse-a-personalizar-debian-testing-stretch-gnome-y-paso-esto/

###TEMAS DE DEBAIN
sudo apt update
sudo apt install arc-theme

### Wallpaper
https://wiki.debian.org/DebianArt/Themes/Infinite?action=AttachFile&do=view&target=debian-infinite.png

########### DEBIAN TESTING REPOS #############
 
## Seguridad testing
deb http://security.debian.org/ testing/updates main contrib non-free
#deb-src http://security.debian.org/ testing/updates main contrib non-free
 
## Oficiales testing
deb http://ftp.fr.debian.org/debian/ testing main contrib non-free
#deb-src http://ftp.fr.debian.org/debian/ testing main contrib non-free
 
## Multimedia testing
## Añadir la key del repositorio #apt install deb-multimedia-keyring
deb http://www.deb-multimedia.org testing main non-free
#deb-src http://www.deb-multimedia.org/ testing main non-free