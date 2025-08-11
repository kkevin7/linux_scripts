# remote insertion
mariadb --ssl-verify-server-cert=FALSE -h 34.209.216.224 -P 3306 -u palomar-user -p palomar_v3 < ./palomar_v3_2025_07_15_migrated_2.sql

# Only conecction
mariadb --ssl-verify-server-cert=FALSE -h 34.209.216.224 -P 3306 -u palomar-user -p
