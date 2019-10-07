#Listar particiones
sudo fdisk -l

#formatear particion
sudo mkfs.vfat -F 32 -n KEVIN /dev/sdb1