#------------google chrome ----------------------
apt-get install google-chrome-stable && \

#------jdk-8-----------falta acepar licencia-----
add-apt-repository ppa:webupd8team/java && \
apt-get update && \
apt-get install oracle-java8-installer && \
apt-get install oracle-java8-set-default && \

#-------Workbench ----------
apt-get install mysql-workbench && \

#-------Brackets-----------------------
#apt-get purge brackets
add-apt-repository ppa:webupd8team/brackets && \
apt-get update && \
apt-get install brackets && \

#-----Sublime Text 3: --------- 
add-apt-repository ppa:webupd8team/sublime-text-3 && \
apt-get update && \
apt-get install sublime-text-installer && \

#--------- GNOME Shell Extensions -----------
add-apt-repository ppa:ne0sight/chrome-gnome-shell && \
apt-get update && \
apt-get install chrome-gnome-shell && \

#-------- Maven-compilador--------------------
apt-get install -y maven && \

#----------- GIT ----------------------------
apt-get install -y git && \

#------------- GIMP imagenes -------------------
apt-get install gimp && \

#----------- Docker -------------------------
#apt-get remove docker docker-engine && \
apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common && \
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -  && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get install docker-ce && \

#-----docker compose ---------
curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose && \

#------docker images -------
#docker pull mariadb:latest && \
#docker pull payara/server-full && \

#------Solucion GTK --------------
apt-get install libcanberra-gtk-module
apt-get install libcanberra-gtk*

#--------- MAKE ----------------
apt-get install make && \

#----------- GCC ----------
apt-get install gcc 

#------Netbeans configuracion ---------------
apt-get install netbeans
apt-get remove netbeans
