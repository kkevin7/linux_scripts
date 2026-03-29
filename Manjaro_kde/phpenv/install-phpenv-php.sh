#!/bin/bash

set -e

echo "🚀 Starting phpenv and PHP installation..."

PHPENV_ROOT="$HOME/.phpenv"
BASH_RC="$HOME/.bashrc"
ZSH_RC="$HOME/.zshrc"

PHP_VERSIONS=("7.4.33" "8.1.27" "8.2.17")

echo "📦 Installing required dependencies..."
sudo pacman -S --needed --noconfirm \
  git base-devel curl \
  openssl libxml2 libzip bzip2 oniguruma sqlite \
  libpng libjpeg-turbo freetype2 icu readline libxslt

# Install phpenv if not present
if [ ! -d "$PHPENV_ROOT" ]; then
  echo "⬇️ Installing phpenv..."
  curl -L https://raw.githubusercontent.com/phpenv/phpenv-installer/master/bin/phpenv-installer | bash
else
  echo "✅ phpenv is already installed"
fi

configure_shell() {
  local RC_FILE=$1

  [ -f "$RC_FILE" ] || touch "$RC_FILE"

  if ! grep -q "phpenv init" "$RC_FILE"; then
    echo "🔧 Configuring phpenv in $RC_FILE"
    {
      echo ""
      echo "# >>> phpenv configuration >>>"
      echo 'export PHPENV_ROOT="$HOME/.phpenv"'
      echo 'export PATH="$PHPENV_ROOT/bin:$PATH"'
      echo 'eval "$(phpenv init -)"'
      echo "# <<< phpenv configuration <<<"
    } >> "$RC_FILE"
  else
    echo "ℹ️ phpenv already configured in $RC_FILE"
  fi
}

# Configure both shells
configure_shell "$BASH_RC"
configure_shell "$ZSH_RC"

# Load phpenv for current session
export PHPENV_ROOT="$HOME/.phpenv"
export PATH="$PHPENV_ROOT/bin:$PATH"
eval "$(phpenv init -)"

# Update phpenv
echo "🔄 Updating phpenv..."
cd "$PHPENV_ROOT" && git pull

# Install PHP versions
for VERSION in "${PHP_VERSIONS[@]}"; do
  if ! phpenv versions | grep -q "$VERSION"; then
    echo "🐘 Installing PHP $VERSION..."
    phpenv install "$VERSION"
  else
    echo "✅ PHP $VERSION is already installed"
  fi
done

phpenv rehash

# Source shell configs (affects only this script shell)
echo "🔄 Reloading shell configuration..."
source "$BASH_RC" 2>/dev/null || true
source "$ZSH_RC" 2>/dev/null || true

echo "🎉 Installation completed successfully"
echo "⚠️ Open a NEW terminal to use phpenv globally"
echo "👉 Example: phpenv global 8.1.27"
