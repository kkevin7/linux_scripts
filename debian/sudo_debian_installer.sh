#!/bin/bash

# Check if the script is running as root or as su
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or switch to root using 'su -' before executing."
    exit 1
fi

# Install sudo if not installed
echo "Installing sudo..."
apt update && apt install -y sudo

# Get the current username
current_user="$USER"

echo "Checking sudo privileges for user: $current_user"

# Check if the user already has sudo access
if sudo -l -U "$current_user" | grep -q "(ALL) ALL"; then
    echo "User $current_user already has sudo privileges. No changes needed."
    exit 0
fi

# Check if the user exists
if id "$current_user" &>/dev/null; then
    echo "Adding $current_user to the sudo group..."
    usermod -aG sudo "$current_user"
else
    echo "User $current_user does not exist. Please create it first using 'adduser current_user'"
    exit 1
fi

# Configure sudoers
visudo_config="${current_user} ALL=(ALL) ALL"
if ! grep -q "$visudo_config" /etc/sudoers; then
    echo "$visudo_config" >> /etc/sudoers
    echo "Sudo has been configured for $current_user."
else
    echo "User already has sudo permissions in sudoers."
fi

# Final message
echo "Configuration completed. Log out and log back in to apply the changes."
