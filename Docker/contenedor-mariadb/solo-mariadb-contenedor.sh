#docker pull mariadb:latest && \
docker run -p 3306:3306 --name mariadbtest -e MYSQL_ROOT_PASSWORD=12345 -d mariadb && \
docker start mariadbtest && \
docker exec -it mariadbtest bash
#mysql -u root -p12345 
