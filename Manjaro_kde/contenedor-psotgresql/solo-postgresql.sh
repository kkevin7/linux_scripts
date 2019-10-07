#docker run -p 5432:5432 --name postgres-normal -e POSTGRES_PASSWORD=12345 -d postgres
docker run -p 5432:5432 --name postgres-normal -e POSTGRES_PASSWORD=12345 -e POSTGRES_USER=kevin -d postgres
docker start postgres-docker
docker exec -it postgres-docker bash

#----Iniciar postgressql gestorDB---------
#psql -U username -W -h iphost basename
#psql -h postgresql.guebs.net -U nombre_de_usuario -d nombre_de_base_de_datos
psql -U kevin -W
psql -U postgres -W


#Creación de un usuario:
CREATE USER nombre_usuario WITH password '6543'

#Eliminar usuario:
DROP USER nombre_usuario

#Crear base de datos:
CREATE DATABASE nombre_db WITH OWNER nombre_usuario;

#Eliminar base de datos:
DROP DATABASE nombre_db

#Acceder database con usuario x:
psql -U nombre_usuario nombre_db

#Salir de postgres
\q

#Mostrar Usuarios
\du