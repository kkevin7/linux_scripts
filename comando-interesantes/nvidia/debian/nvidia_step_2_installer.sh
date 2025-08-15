#!/bin/bash
set -e

echo "=== Step 2: Instalador NVIDIA para Debian 13 - Entorno GNOME ==="

# Instalar drivers NVIDIA
echo "[5/9] Instalando drivers NVIDIA..."
sudo apt install -y nvidia-driver nvidia-detect nvidia-settings nvidia-smi

