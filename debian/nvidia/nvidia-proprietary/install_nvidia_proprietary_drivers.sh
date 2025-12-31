# Documentation
# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Debian&target_version=13&target_type=deb_network

# Using nvidia-detect
# This script requires installation itself, but it will also recommended which driver to install:

sudo apt install -y build-essential
sudo apt install -y nvidia-detect
nvidia-detect

# Kernel headers
# In standard cases you can just ask apt to install linux-headers-generic virtual package and it will pick the right blend for you:

sudo apt install -y linux-headers-$(uname -r) linux-headers-generic

# To install the proprietary flavor, packages nvidia-kernel-dkms and nvidia-driver should be installed:

wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-13-1

sudo apt-get install -y nvidia-open
# sudo apt-get install -y cuda-drivers

# Post-installation steps for Trixie

sudo apt install -y dkms
sudo dkms status

# To enable kernel modesetting with the NVIDIA driver:

sudo echo 'GRUB_CMDLINE_LINUX="$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1 nvidia-drm.fbdev=1"' > /etc/default/grub.d/nvidia-modeset.cfg
sudo update-grub

# To install the helper scripts, install the nvidia-suspend-common package. Afterwards you need to enable them:

# sudo systemctl enable nvidia-suspend.service
# sudo systemctl enable nvidia-hibernate.service
# sudo systemctl enable nvidia-resume.service

# In addition, you will need to verify whether the PreserveVideoMemoryAllocations NVIDIA module parameter is turned on. Without the parameter being enabled, the udev rules in /usr/lib/udev/rules.d/61-gdm.rules will force a fallback to X11. To check the value of PreserveVideoMemoryAllocations:

# cat /proc/driver/nvidia/params | grep PreserveVideoMemoryAllocations
# PreserveVideoMemoryAllocations: 1

sudo echo 'options nvidia NVreg_PreserveVideoMemoryAllocations=1' > /etc/modprobe.d/nvidia-power-management.conf
