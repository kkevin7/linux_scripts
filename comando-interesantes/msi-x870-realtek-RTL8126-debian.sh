#!/usr/bin/env bash
set -e

DRIVER="realtek-r8126-dkms"
PPA="ppa:awesometic/ppa"

echo "=== Instalando dependencias básicas ==="
sudo apt update
sudo apt install -y \
    build-essential \
    dkms \
    git \
    linux-headers-$(uname -r) \
    wget \
    curl \
    initramfs-tools \
    apt-transport-http \
    ca-certificates

echo "=== Añadiendo PPA (método recomendado) ==="
if ! grep -R "${PPA}" /etc/apt/sources.list* &>/dev/null; then
  sudo add-apt-repository -y "${PPA}"
  sudo apt update
fi

echo "=== Instalando el paquete DKMS ==="
sudo apt install -y ${DRIVER} || {
  echo "Error instalando ${DRIVER}, intentando reparar dependencias..."
  sudo apt install -f -y
  sudo apt install -y ${DRIVER}
}

echo "=== Verificando módulos cargados ==="
if lsmod | grep -iq r8169; then
  echo "El módulo r8169 está cargado y puede interferir con r8126."
  echo "Lo bloquearemos..."
  sudo tee /etc/modprobe.d/blacklist-r8169.conf >/dev/null <<EOF
# Para usar el driver r8126 explícitamente
blacklist r8169
EOF
  echo "Actualizando initramfs..."
  sudo update-initramfs -u
else
  echo "No se detectó el módulo r8169 cargado."
fi

echo "=== Reiniciando sistema para aplicar cambios ==="
echo "Por favor, reinicia para completar la instalación."