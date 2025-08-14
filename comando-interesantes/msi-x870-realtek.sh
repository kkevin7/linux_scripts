sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/r8126-dkms.git
cd r8126-dkms
makepkg -si
# sudo reboot
lspci -k | grep -A 3 -i 8126