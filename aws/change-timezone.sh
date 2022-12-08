#** Comandos ***
#* Ver Zona horario
timedatectl
cat /etc/timezone

#* Cambiar Zona horario
tzselect

#* Actualizar Zona horaria
sudo rm /etc/localtime
TZ='America/Boise'; export TZ
sudo ln -s /usr/share/zoneinfo/America/Boise /etc/localtime
