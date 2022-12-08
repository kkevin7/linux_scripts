#cat /proc/acpi/wakeup
#cat /proc/acpi/wakeup | grep enabled 

# Run this command:
sudo /bin/bash -c "echo GPP0 >> /proc/acpi/wakeup"

sudo cp disable-GPP0-wakeup.service /etc/systemd/system/

# Restart Services
sudo systemctl daemon-reload
sudo systemctl enable disable-GPP0-wakeup.service
sudo systemctl start disable-GPP0-wakeup.service