#The /proc/cpuinfo file contains details about individual cpu cores. Output its contents with less or cat.
less /proc/cpuinfo

#lscpu is a small and quick command that does not need any options. It would simply print the cpu hardware details in a user-friendly format.
lscpu

#Muestra el modelo exacto del pc
sudo pacman -S dmidecode
sudo dmidecode -t System | grep Product