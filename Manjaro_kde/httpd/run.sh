sudo cp -r ./httpd.conf /etc/httpd/conf
sudo cp -r ./extra/* /etc/httpd/conf/extra/
sudo cp -r ./hosts /etc/hosts

sudo rm -r /srv/http
sudo ln -s /mnt/linux-storage/projects /srv/http