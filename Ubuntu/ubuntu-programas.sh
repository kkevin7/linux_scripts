#------google chrome -------
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
apt-get update && \
apt-get install -y google-chrome-stable && \

#-------Brackets---------
add-apt-repository ppa:webupd8team/brackets && \
apt-get update && \
apt-get install -y brackets && \

#-----Sublime Text 3: ---------
add-apt-repository ppa:webupd8team/sublime-text-3 && \
apt-get update && \
apt-get install -y sublime-text-installer && \

#--------Okular Visor PDF----------------------
#apt-get update && \
#apt-get install -y okular && \

#-----unzip------------
#apt-get install -y unzip && \

#-----libre office---------
#add-apt-repository ppa:libreoffice/ppa
#apt-get update
#apt-get install libreoffice

#------jdk-8-----------falta acepar licencia-----
add-apt-repository ppa:webupd8team/java && \
#apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
apt-get update && \
apt-get install -y oracle-java8-installer && \
apt-get install -y oracle-java8-set-default && \

###----Workbench--------
apt-get install -y mysql-workbench && \

#-------------Docker -----------------------------------
#apt-get install \
#    apt-transport-https \
#    ca-certificates \
#    curl \
#    software-properties-common && \
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
#----De momento no funciona------------------------
#add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable" && \
#apt-get update &&\
#apt-get install docker-ce && \
#apt-cache madison docker-ce && \

#------docker------------
apt-get update && \
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' && \
apt-get update &&\
apt-cache policy docker-engine && \
apt-get install -y docker-engine && \
systemctl status docker && \

#-------instalar-docker-de-forma-sencilla------
#curl -sSL https://get.docker.com/ | sh

#-----docker compose ---------
curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose && \

#----Maven-compilador---------
apt-get install -y maven && \

#------docker images -------
docker pull mariadb:latest && \
docker pull payara/server-full && \

#----------- GIT ----------------------------
apt-get install -y git && \

#------------- GIMP imagenes -------------------
apt-get install -y gimp 


##---------install npm ------------------------
apt-get install -y npm

#---------- instal gulp--------------------------
npm install gulp

##---------Node JS -------------------------
apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
apt-get install nodejs

#------- libc 32 bits --------------------
cd /etc/apt/sources.list.d
echo "deb http://old-releases.ubuntu.com/ubuntu/ raring main restricted universe multiverse" >ia32-libs-raring.list
apt-get update
apt-get install ia32-libs
apt-get install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1
apt-get install -y linux-libc-dev
apt-get install -y libc6 libgcc1 libstdc++5 libstdc++6 gcc-multilib g++-multilib


#----netbeas 8.2
#apt-get purge openjdk* && \
#add-apt-repository ppa:webupd8team/java  && \
#apt-get update && \
#apt-get install -y oracle-java8-installer && \
#cd Descargas/ && \
#wget http://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-linux.sh && \
#chmod +x netbeans-8.2-linux.sh && \
#./netbeans-8.2-linux.sh 

