# Run this command:
sudo /bin/bash -c "echo GPP0 >> /proc/acpi/wakeup"

# Create this service:
sudo nano /etc/systemd/system/disable-GPP0-wakeup.service

#-----------------------------------------------------------
[Unit]
Description=Fix suspend by disabling GPP0 sleepstate thingie

[Service]
ExecStart=/bin/bash -c "echo GPP0 >> /proc/acpi/wakeup"

[Install]
WantedBy=multi-user.target
#-----------------------------------------------------------

# Restart Services
sudo systemctl enable disable-GPP0-wakeup.service
sudo systemctl start disable-GPP0-wakeup.service
sudo systemctl daemon-reload
