# You can remove all packages on your system with nvidia and cuda in the name together with their configs and automatic dependencies by running the following command:

sudo apt-get --autoremove purge '*nvidia*' '*nvidia*:i386' '*cuda*' '*cuda*:i386'

# Afterwards reboot the system:

sudo systemctl reboot

