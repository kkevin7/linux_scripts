# This should leave you with a functioning system in almost all cases. If it seems to still be having issues, you may also try running:

sudo apt install --reinstall xserver-xorg-core xserver-xorg-video-nouveau

# Some NVIDIA cards will also need a firmware with nouveau, you might also need to reinstall the firmware with:

sudo apt install --reinstall firmware-nvidia-graphics
sudo update-initramfs -u -k all 
sudo systemctl reboot