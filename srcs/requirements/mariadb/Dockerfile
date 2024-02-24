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

COPY tools/mysql.sh .

RUN chmod +x mysql.sh

# Start MySQL service, and create a dababase, a user and grant all priviligies to that user
ENTRYPOINT [ "./mysql.sh" ]

# Adds some safety features such as restarting the server when an error occurs
#   and logging runtime information to an error log.
# CMD ["mysqld_safe"]
