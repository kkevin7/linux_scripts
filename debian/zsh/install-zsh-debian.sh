#!/bin/bash

# --------------------------------------------------
# Ensure the script is running as root
# --------------------------------------------------
if [ "$EUID" -ne 0 ]; then
    echo "🔒 This script must be run as root. Re-running with sudo..."
    exec sudo "$0" "$@"
fi

# --------------------------------------------------
# Variables
# --------------------------------------------------
TARGET_USER="${SUDO_USER:-$USER}"
USER_HOME=$(eval echo "~$TARGET_USER")
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "👤 Target user: $TARGET_USER"
echo "🏠 Home directory: $USER_HOME"

# --------------------------------------------------
# Update package lists
# --------------------------------------------------
apt update

# --------------------------------------------------
# Install required packages
# --------------------------------------------------
apt install -y \
    zsh \
    git \
    curl \
    wget \
    fzf \
    fonts-powerline \
    fonts-firacode

# --------------------------------------------------
# Refresh font cache
# --------------------------------------------------
echo "🔤 Refreshing font cache..."
fc-cache -f -v

# --------------------------------------------------
# Install Oh My Zsh (as the target user)
# --------------------------------------------------
if [ ! -d "$USER_HOME/.oh-my-zsh" ]; then
    echo "🚀 Installing Oh My Zsh..."
    sudo -u "$TARGET_USER" sh -c '
        RUNZSH=no CHSH=no \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    '
fi

# --------------------------------------------------
# Install Powerlevel10k theme
# --------------------------------------------------
P10K_DIR="$USER_HOME/.oh-my-zsh/custom/themes/powerlevel10k"

if [ ! -d "$P10K_DIR" ]; then
    echo "🎨 Installing Powerlevel10k theme..."
    sudo -u "$TARGET_USER" git clone --depth=1 \
        https://github.com/romkatv/powerlevel10k.git \
        "$P10K_DIR"
fi

# --------------------------------------------------
# Install Zsh plugins
# --------------------------------------------------
CUSTOM_PLUGINS="$USER_HOME/.oh-my-zsh/custom/plugins"

sudo -u "$TARGET_USER" git clone \
    https://github.com/zsh-users/zsh-autosuggestions \
    "$CUSTOM_PLUGINS/zsh-autosuggestions" 2>/dev/null || true

sudo -u "$TARGET_USER" git clone \
    https://github.com/zsh-users/zsh-syntax-highlighting \
    "$CUSTOM_PLUGINS/zsh-syntax-highlighting" 2>/dev/null || true

# --------------------------------------------------
# Configure .zshrc
# --------------------------------------------------
ZSHRC="$USER_HOME/.zshrc"

sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC"
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf)/' "$ZSHRC"

# --------------------------------------------------
# Set Zsh as the default shell
# --------------------------------------------------
chsh -s "$(which zsh)" "$TARGET_USER"

# --------------------------------------------------
# Fix ownership
# --------------------------------------------------
chown -R "$TARGET_USER:$TARGET_USER" \
    "$USER_HOME/.oh-my-zsh" \
    "$USER_HOME/.zshrc"

# --------------------------------------------------
# Done
# --------------------------------------------------
echo ""
echo "✅ Zsh installation completed successfully"
echo "✨ Theme: Powerlevel10k"
echo "🔌 Plugins: autosuggestions, syntax-highlighting, fzf"
echo "🔤 Font installed: FiraCode"
echo "➡️ Zsh is now your default shell"
echo ""
echo "ℹ️ Set 'FiraCode' as your terminal font and open a new terminal"
