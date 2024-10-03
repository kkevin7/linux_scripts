# Documentation
# https://www.linuxadictos.com/como-recuperar-el-grub-de-manjaro-explicado-por-el-bot-del-canal-oficial-de-telegram-del-proyecto-en-espanol.html

manjaro-chroot -a
pacman -Sy grub
lsblk -f
#grub-install /dev/sda
#grub-install --force --target=i386-pc --recheck --boot-directory=/boot /dev/nvme0n1
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=manjaro --recheck
update-grub
