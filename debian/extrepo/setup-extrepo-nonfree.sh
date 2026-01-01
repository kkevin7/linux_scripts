#!/bin/sh
set -e

# --------------------------------------------------
# Re-run script with sudo if not running as root
# --------------------------------------------------
if [ "$(id -u)" -ne 0 ]; then
    echo "🔒 This script must be run as root. Re-running with sudo..."
    exec sudo sh "$0" "$@"
fi

# --------------------------------------------------
# Resolve script directory (POSIX compatible)
# --------------------------------------------------
SCRIPT_PATH=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

echo "🚀 Replacing extrepo configuration..."
echo "📂 Script path: $SCRIPT_PATH"

# --------------------------------------------------
# Paths
# --------------------------------------------------
SOURCE_CONFIG="$SCRIPT_PATH/config.yaml"
TARGET_CONFIG="/etc/extrepo/config.yaml"

# --------------------------------------------------
# Validate source config exists
# --------------------------------------------------
if [ ! -f "$SOURCE_CONFIG" ]; then
    echo "❌ config.yaml not found in script directory"
    exit 1
fi

# --------------------------------------------------
# Ensure target directory exists
# --------------------------------------------------
mkdir -p /etc/extrepo

# --------------------------------------------------
# Replace configuration file
# --------------------------------------------------
echo "🛠️ Copying config.yaml to /etc/extrepo/"
cp "$SOURCE_CONFIG" "$TARGET_CONFIG"

# --------------------------------------------------
# Set correct permissions
# --------------------------------------------------
chmod 644 "$TARGET_CONFIG"

# --------------------------------------------------
# Update extrepo metadata
# --------------------------------------------------
echo "🔄 Updating extrepo indexes..."
extrepo update

# --------------------------------------------------
# Update APT repositories
# --------------------------------------------------
echo "📦 Updating APT repositories..."
apt update

echo "✅ extrepo configuration replaced successfully"
