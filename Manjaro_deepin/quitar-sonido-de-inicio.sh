#!/bin/bash
#sudo -s
cd /usr/share/sounds/deepin/stereo/
sudo rm desktop-login.wav.bak
sudo rm desktop-logout.wav.bak
sudo rm suspend-resume.wav.bak
sudo mv desktop-login.wav desktop-login.wav.bak
sudo mv desktop-logout.wav desktop-logout.wav.bak
sudo mv suspend-resume.wav suspend-resume.wav.bak
sudo touch desktop-login.wav
sudo touch desktop-logout.wav
sudo touch suspend-resume.wav
exit
