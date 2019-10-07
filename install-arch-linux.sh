#### Arch linux kde ####

pacman -Syyu --noconfirm

#dar formatos
mkfs.ext4 /dev/sda10
mkswap /dev/sda6

#montajes de particiones
mount /dev/sda9 /mnt 
mkdir /mnt/home
mount /dev/sda10 /mnt
pacstrap /mnt base base-devel grub-bios networkmanager os-prober

##########
pacman -Syyu --noconfirm
pacstrap /mnt grub-bios
genfstab -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash

nano /etc/locale.gen #es_MX.UTF-8 UTF-8 ##tal vez podria ser --> es_SV.UTF-8 UTF-8
locale-gen
#echo LANG=es_SV.UTF-8 > /etc/locale.conf
#export LANG=es_US.UTF-8
echo KEYMAP=la-latin1 > /etc/vconsole.conf
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.conf
mkinitcpio -p linux


umount /mnt
reboot

systemctl enable NetworkManger.service
systemctl start NetworkManger.service
useradd -m -g user -G audio,lp,optical,storage,video,whele,games,power,scanner -s /bin/bash kevin
###password
##deconmentar una linea

#
sudo pacman -Syyu
sudo pacman -S xorg-server xorg-xinir xorg-utils xorg-serve-utils mesa mesa-demos xf86-video-vesa xorg-tum xorg-xclock xterm
sudo pacman -S kdebase 
