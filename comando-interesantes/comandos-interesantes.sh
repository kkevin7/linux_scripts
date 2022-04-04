#Borrar cache de programa
sudo ssh -i ~/.ssh/sim.pem -N -f -L 3308:localhost:3306 bitnami@44.242.91.11
sudo ssh -i Test-Env-97tools-Key.pem -N -f -L 3308:localhost:3306 admin@44.235.67.151