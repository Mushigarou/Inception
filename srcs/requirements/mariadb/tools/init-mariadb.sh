#!/bin/bash

service mariadb start
sleep 3
mariadb -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mariadb -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
mysqld_safe
