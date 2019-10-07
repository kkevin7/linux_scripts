#---------------Repositories Deepin---------------------

#Add-apt-repository
apt-get install python-software-properties &&\
apt-get install software-properties-common &&\
apt-get install apt-file && apt-file update &&\
apt-get install python3.6

#------jdk-8-----------falta acepar licencia-----
#add-apt-repository ppa:webupd8team/java && \
#apt-get update && \
#apt-get install oracle-java8-installer && \
#apt-get install oracle-java8-set-default && \

#-------Workbench ----------
apt-get install mysql-workbench && \

#-------Brackets-----------------------
#add-apt-repository ppa:webupd8team/brackets && \
#apt-get update && \
#apt-get install brackets && \

#-----Sublime Text 3: --------- 
#add-apt-repository ppa:webupd8team/sublime-text-3 && \
#apt-get update && \
#apt-get install sublime-text-installer && \

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
chmod +x /usr/local/bin/docker-compose 

#------docker images -------
#docker pull mariadb:latest && \
#docker pull payara/server-full && \



#add-apt-repository ppa:webupd8team/sublime-text-3 
#apt-key adv --keyserver keyserver.ubuntu.com --recv 7B2C3B0889BF5709A105D03AC2518248EEA14886
#deb http://ppa.launchpad.net/webupd8team/sublime-text-3/ubuntu 
