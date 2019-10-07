sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
cd /home/$(whoami)/Descargas
wget http://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-linux.sh
sudo chmod +x netbeans-8.2-linux.sh
sudo sh netbeans-8.2-linux.sh