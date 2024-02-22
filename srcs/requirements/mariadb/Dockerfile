# Base image
ARG RELEASE=buster
FROM debian:${RELEASE}

# Installs necessary tools
RUN apt update && apt upgrade -y && apt install \
                                        nano \
                                        curl \
                                        mariadb-server \
                                        -y

# Copy current config file mariadb.conf.d folder
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Temporary Environment variables for testing purposes
ENV SQL_DATABASE=mfouadiDB \
    SQL_USER=mfouadi \
    SQL_PASSWORD=1236 \
    SQL_ROOT_PASSWORD=123456

# mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE}"

# Start MySQL service, and create a dababase, a user and grant all priviligies to that user
RUN service mysql start \
    && mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" \
    && mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" \
    && mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" \
    && mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" \
    && mysql  -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;" \
    && mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Adds some safety features such as restarting the server when an error occurs
#   and logging runtime information to an error log.
CMD ["mysqld_safe"]

