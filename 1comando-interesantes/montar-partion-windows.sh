mkdir /media/windows
#fdisk -l | grep NTFS
mount -t ntfs-3g -o ro /dev/sda3 /media/windows
