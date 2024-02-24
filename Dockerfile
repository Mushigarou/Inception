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

# Start MySQL service, and create a dababase, a user and grant all priviligies to that user
RUN service mysql start \
    && mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" \
    && mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" \
    && mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" \
    && mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" \
    && mysql  -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;" \
    && mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# # Adds some safety features such as restarting the server when an error occurs
# #   and logging runtime information to an error log.
# CMD ["mysqld_safe"]

#-------------------------------------------------------------------------------------------------#

# Installing nginx, openssl, other utils, and creating a directory for certificates
RUN apt install nginx openssl -y \
    && mkdir -p /etc/nginx/ssl

# creating a certificate which nginx will use
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key \
    -subj "/C=MA/ST=CA/L=Mar/O=1337/OU=1337/CN=mfouadi.42.fr/UID=mfouadi"

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

# # ENTRYPOINT [ "/bin/zsh" ]

# CMD ["nginx", "-g", "daemon off;"]
# # CMD ["nginx"]


#-------------------------------------------------------------------------------------------------#

#   php7.4-mysql    - for working with MySQL databases
#   php7.4-fpm      - separates the task of handling PHP requests from the web server
#   mariadb-client  - for interacting with mariaDB databases
#   apt-cache depends php7.4 [shows dependencies]

RUN apt install -y wget

# Installing php 7.4
    # Adds SURY PHP PPA repository
    # Adds some packages managing repositories and downloading files over HTTPS
RUN apt install -y lsb-release apt-transport-https ca-certificates \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | cat > /etc/apt/sources.list.d/php.list \
    && apt update \
    && apt install -y php7.4 php7.4-fpm php7.4-mysql mariadb-client

# Installing wordpress, WP CLI, and extracting it 
RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www \
    && cd /var/www \
    && tar -xvf wordpress-6.4.3.tar.gz \
    && rm wordpress-6.4.3.tar.gz \
    && chown -R root:root /var/www/wordpress \
    && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Changed listen from Unix Socket to TCP socket && [clear_env] make all
#   environment variables available to PHP code via getenv()
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# EXPOSE 80
# EXPOSE 9000
