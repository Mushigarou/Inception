#!/bin/bash
SQL_DATABASE=testDB
SQL_USER=tester
SQL_PASSWORD=1236
SQL_ROOT_PASSWORD=123456
service mariadb start

sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mariadb -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
mysqld_safe

# mariadb  -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
# mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mariadb-admin -u root -p$SQL_ROOT_PASSWORD shutdown