#!/bin/bash
set -e

echo "=== Step 1: Instalador NVIDIA para Debian 13 - Entorno GNOME ==="

# 1. Actualizar sistema
echo "[1/9] Actualizando sistema..."
sudo apt update && sudo apt full-upgrade -y

# 2. Instalar herramientas base si faltan
echo "[2/9] Instalando herramientas básicas..."
sudo apt install -y build-essential dkms linux-headers-$(uname -r) \
    firmware-misc-nonfree initramfs-tools util-linux systemd-sysv
sudo apt install -y $(ls /boot/vmlinuz-* | sed 's/.*vmlinuz-//' | xargs -I{} echo linux-headers-{})

# reboot the system
sudo reboot
