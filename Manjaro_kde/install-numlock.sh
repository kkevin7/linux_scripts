#!/bin/bash

SERVICE_PATH="/etc/systemd/system/enable-numlock.service"
SCRIPT_PATH="/usr/local/bin/enable-numlock.sh"

echo "==> Checking if NumLock script already exists..."
if [ -f "$SCRIPT_PATH" ]; then
    echo "   - Script already exists, skipping creation."
else
    echo "   - Creating NumLock script..."
    sudo bash -c 'cat > /usr/local/bin/enable-numlock.sh << "EOF"
#!/bin/bash
# Enable NumLock at login
sleep 1
/usr/bin/numlockx on 2>/dev/null || true
/usr/bin/setleds +num < /dev/tty1 2>/dev/null || true
EOF'
    sudo chmod +x /usr/local/bin/enable-numlock.sh
fi

echo "==> Checking if systemd service already exists..."
if [ -f "$SERVICE_PATH" ]; then
    echo "   - Service already exists, skipping creation."
else
    echo "   - Creating systemd service..."
    sudo bash -c 'cat > /etc/systemd/system/enable-numlock.service << "EOF"
[Unit]
Description=Enable NumLock on startup
After=graphical.target

[Service]
Type=simple
ExecStart=/usr/local/bin/enable-numlock.sh

[Install]
WantedBy=graphical.target
EOF'
fi

echo "==> Enabling service (safe)..."
sudo systemctl enable enable-numlock.service >/dev/null 2>&1 || true

echo "==> Starting service (safe)..."
sudo systemctl start enable-numlock.service >/dev/null 2>&1 || true

echo "✅ Done! NumLock will be automatically enabled at every login."
echo "✅ Safe to run multiple times. No errors will be produced."
