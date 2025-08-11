#!/bin/bash
set -e

echo "=== Instalador NVIDIA para Debian 13 (MSI RTX 4070 Ventus) - Entorno GNOME ==="

# 1. Actualizar sistema
echo "[1/9] Actualizando sistema..."
sudo apt update && sudo apt full-upgrade -y

# 2. Instalar herramientas base si faltan
echo "[2/9] Instalando herramientas básicas..."
sudo apt install -y build-essential dkms linux-headers-$(uname -r) \
    firmware-misc-nonfree initramfs-tools util-linux systemd-sysv

# 3. Eliminar driver 'nouveau'
echo "[3/9] Bloqueando driver 'nouveau'..."
sudo apt purge -y xserver-xorg-video-nouveau || true
echo "blacklist nouveau" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u

# 4. Activar repositorios contrib y non-free
echo "[4/9] Activando repositorios contrib y non-free..."
sudo sed -i 's/main/main contrib non-free non-free-firmware/g' /etc/apt/sources.list
sudo apt update

# 5. Instalar drivers NVIDIA
echo "[5/9] Instalando drivers NVIDIA..."
sudo apt install -y nvidia-driver nvidia-detect nvidia-settings nvidia-smi

# 6. Configurar GNOME para usar NVIDIA y Xorg en lugar de Wayland
echo "[6/9] Configurando GNOME para forzar Xorg (desactivar Wayland)..."
sudo mkdir -p /etc/gdm3/conf.d
cat <<EOF | sudo tee /etc/gdm3/conf.d/01-disable-wayland.conf
[daemon]
WaylandEnable=false
EOF

# 7. Regenerar initramfs y cargar módulo NVIDIA
echo "[7/9] Regenerando initramfs y cargando módulo NVIDIA..."
sudo update-initramfs -u
sudo modprobe nvidia || true

# 8. Reiniciar
echo "[8/9] Instalación completada. Reinicia para aplicar los cambios."
read -p "¿Quieres reiniciar ahora? (s/n): " REBOOT
if [[ "$REBOOT" =~ ^[sS]$ ]]; then
    sudo reboot
else
    echo "Reinicia manualmente para completar la instalación."
fi
