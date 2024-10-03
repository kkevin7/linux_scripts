sudo cp -r ./httpd.conf /etc/httpd/conf
sudo cp -r ./extra/* /etc/httpd/conf/extra/
sudo cp -r ./hosts /etc/hosts

sudo rm -r /srv/http
sudo ln -s /mnt/linux-storage/projects /srv/http

#Ceritificates
#sudo mkdir -p /etc/httpd/ssl
#sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/httpd/ssl/localserver.key -out /etc/httpd/ssl/localserver.crt
#sudo nano /etc/httpd/conf/extra/httpd-ssl.conf