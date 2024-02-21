# Base image
ARG RELEASE=buster
FROM debian:${RELEASE}

# Installs necessary tools
RUN apt update && apt upgrade -y && apt install \
                                        zsh \
                                        nano \
                                        curl \
                                        git \
                                        vim \
                                        mariadb-server \
                                        -y

# Copy current config file mariadb.conf.d folder
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN export SQL_USER=mfouadi SQL_DATABASE=mfouadiDB SQL_PASSWORD=123456 SQL_ROOT_PASSWORD=123456
# Start MySQL service, and create a dababase, a user and grant all priviligies to that user
RUN service mysql start \
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" && \
    mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost IDENTIFIED BY `${SQL_PASSWORD}`;" && \
    mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" && \
    mysql -e "FLUSH PRIVILEGES;"
    # mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown &&

# installing zsh
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ENTRYPOINT [ "/bin/zsh" ]

CMD ["mysqld"]

