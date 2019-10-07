#------------ Actualizar ------------------
sudo zypper ref 
sudo apt-get -y update

#------------ nano -------------------------
sudo apt-get install -y nano

#------------ gedit	------------------------
sudo apt-get install -y gedit

#------------ Google chrome -------------------
sudo zypper ar http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
sudo zypper -n ref 
cd /tmp/
wget https://dl.google.com/linux/linux_signing_key.pub
sudo rpm --import linux_signing_key.pub
cd /tmp/
sudo rm -R linux_signing_key.pub
sudo zypper -n in google-chrome-stable

#------------ Sublime Text ----------------------------
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo zypper addrepo -g -f https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo zypper -n install sublime-text



