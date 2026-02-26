#!/usr/bin/env bash

set -e

echo "🔹 Installing or updating NVM (latest version)..."

NVM_DIR="$HOME/.nvm"

# Fix permissions if directory exists
if [ -d "$NVM_DIR" ]; then
  sudo chown -R $USER:$USER "$NVM_DIR" 2>/dev/null || true
fi

# Install latest NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

add_nvm_config() {
  FILE=$1

  if [ -f "$FILE" ]; then
    if ! grep -q 'NVM_DIR="$HOME/.nvm"' "$FILE"; then
      echo "🔹 Adding NVM config to $FILE"
      {
        echo ''
        echo '# NVM Configuration'
        echo 'export NVM_DIR="$HOME/.nvm"'
        echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'
      } >> "$FILE"
    else
      echo "✔ NVM already configured in $FILE"
    fi
  fi
}

# Always configure bash
add_nvm_config "$HOME/.bashrc"

# Configure profile if exists (important for login shells / SSH)
add_nvm_config "$HOME/.profile"

# Configure zsh only if it exists
if [ -f "$HOME/.zshrc" ]; then
  add_nvm_config "$HOME/.zshrc"
fi

# Load NVM in current session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "🔹 Installing latest LTS Node.js..."
nvm install --lts
nvm alias default lts/*

echo "✅ Installation complete!"
echo "NVM version: $(nvm --version)"
echo "Node version: $(node -v)"