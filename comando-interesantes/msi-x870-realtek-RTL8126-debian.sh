#!/bin/bash
set -euo pipefail

# ==========================
# Realtek RTL8126 DKMS Installer for Debian/Ubuntu
# ==========================

echo "[INFO] Actualizando lista de paquetes..."
sudo apt update

echo "[INFO] Instalando dependencias necesarias..."
sudo apt install -y \
    build-essential \
    dkms \
    git \
    linux-headers-$(uname -r) \
    software-properties-common \
    wget \
    curl \
    initramfs-tools \
    ca-certificates

echo "[INFO] Agregando PPA de awesometic..."
sudo add-apt-repository -y ppa:awesometic/ppa
sudo apt update

echo "[INFO] Instalando paquete realtek-r8126-dkms..."
sudo apt install -y realtek-r8126-dkms

echo "[INFO] Creando blacklist para r8169..."
echo "blacklist r8169" | sudo tee /etc/modprobe.d/blacklist-r8169.conf > /dev/null

echo "[INFO] Actualizando initramfs..."
sudo update-initramfs -u

echo "[INFO] Instalación completada."
echo "Se recomienda reiniciar el sistema para aplicar los cambios."
lspci | grep -i realtek