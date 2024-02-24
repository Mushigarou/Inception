#   php7.4-mysql    - for working with MySQL databases
#   php7.4-fpm      - separates the task of handling PHP requests from the web server
#   mariadb-client  - for interacting with mariaDB databases
#   apt-cache depends php7.4 [shows dependencies]

ARG RELEASE=buster
FROM debian:${RELEASE}

RUN apt update && apt upgrade -y \
    && apt install -y curl wget nano

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

					