#!/bin/bash
set -e

# ================================
# Variables
# ================================
KERNEL_VERSION="6.15"
KERNEL_SRC_DIR="/usr/src"

# ================================
# 1. Actualizar sistema y dependencias
# ================================
echo "[1/7] Actualizando sistema..."
sudo apt update && sudo apt upgrade -y

echo "[2/7] Instalando dependencias para compilar kernel..."
sudo apt install -y \
    build-essential \
    libncurses-dev \
    bison \
    flex \
    libssl-dev \
    libelf-dev \
    wget \
    bc \
    kmod \
    cpio \
    fakeroot \
    rsync \
    python3 \
    dwarves \
    pkg-config \
    zlib1g-dev \
    libcap-dev \
    libpci-dev \
    libiberty-dev \
    git \
    tar \
    xz-utils

# ================================
# 2. Descargar kernel
# ================================
cd $KERNEL_SRC_DIR
echo "[3/7] Descargando kernel $KERNEL_VERSION..."
sudo wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$KERNEL_VERSION.tar.xz

# ================================
# 3. Extraer kernel
# ================================
echo "[4/7] Extrayendo kernel..."
sudo tar -xf linux-$KERNEL_VERSION.tar.xz
cd linux-$KERNEL_VERSION

# ================================
# 4. Configuración base
# ================================
echo "[5/7] Copiando configuración actual del kernel..."
sudo cp -v /boot/config-$(uname -r) .config

echo "[5.1] Actualizando configuración del kernel..."
yes "" | sudo make oldconfig

# ================================
# 5. Compilación
# ================================
echo "[6/7] Compilando kernel (esto puede tardar bastante)..."
sudo make -j$(nproc)
sudo make modules_install -j$(nproc)
sudo make install

# ================================
# 6. Actualizar GRUB e initramfs
# ================================
echo "[7/7] Actualizando initramfs y GRUB..."
sudo update-initramfs -c -k $KERNEL_VERSION
sudo update-grub

echo "✅ Instalación completada. Reinicia el sistema y selecciona el kernel $KERNEL_VERSION en GRUB."
