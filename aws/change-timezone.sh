#** Comandos ***
#* Ver Zona horario
timedatectl
cat /etc/timezone

#* Cambiar Zona horario
tzselect
# 2) Americas -> 49) United States -> 19) Mountain - ID (south); OR (east) -> 1) Yes

#* Actualizar Zona horaria
sudo rm /etc/localtime
TZ='America/Boise'; export TZ
sudo ln -s /usr/share/zoneinfo/America/Boise /etc/localtime
