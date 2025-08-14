#!/bin/bash
set -e  # Detener ejecución si hay un error
set -u  # Error si se usa variable no definida

# Variables
TMP_DIR="/tmp/r8126-dkms"
PKG_NAME="r8126-dkms"

echo "[INFO] Instalando dependencias necesarias..."
sudo pacman -S --needed base-devel git dkms linux-firmware-realtek --noconfirm

# Limpiar carpeta temporal si existe
rm -rf "$TMP_DIR"

echo "[INFO] Clonando el repositorio en $TMP_DIR..."
git clone https://aur.archlinux.org/${PKG_NAME}.git "$TMP_DIR"

echo "[INFO] Entrando en la carpeta temporal..."
cd "$TMP_DIR"

echo "[INFO] Compilando e instalando el paquete..."
makepkg -si --noconfirm

# Opcional: reinicio del sistema
# echo "[INFO] Reiniciando el sistema..."
# sudo reboot

echo "[INFO] Verificando la instalación del controlador..."
lspci -k | grep -A 3 -i 8126

echo "[OK] Proceso completado."
lspci | grep -i realtek