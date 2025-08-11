# export
docker exec -i mysql_local mysqldump -u root -p12345 palomar_v3_production > palomar_v3_2025_07_15_migrated_2.sql

# import
docker exec -i mysql_local mysql -u root -p12345 palomar_v3_production < palomar_v3_2025_07_15_migrated_2.sql