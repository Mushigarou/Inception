# Base image
ARG RELEASE=bullseye
FROM debian:${RELEASE}

# Installs necessary tools
RUN apt update && apt upgrade -y && apt install \
                                        nano \
                                        curl \
                                        mariadb-server \
                                        -y

# Copy current config file mariadb.conf.d folder
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy mariadb script to working directory in container
COPY tools/init-mariadb.sh .

# Gives execute permission to mariadb.sh
RUN chmod +x init-mariadb.sh

# EXPOSE 3306

# Start MySQL service, and create a dababase, a user and grant all priviligies to that user
CMD [ "./init-mariadb.sh" ]
