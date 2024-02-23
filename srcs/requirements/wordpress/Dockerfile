#   php7.4-mysql    - for working with MySQL databases
#   php7.4-fpm      - separates the task of handling PHP requests from the web server
#   mariadb-client  - for interacting with mariaDB databases
#   apt-cache depends php7.4 [shows dependencies]


ARG RELEASE=buster
FROM debian:${RELEASE}

RUN apt update && apt upgrade -y \
    && apt install -y curl wget

# Installing php 7.4
    # Adds SURY PHP PPA repository
    # Adds some packages managing repositories and downloading files over HTTPS
RUN apt install -y lsb-release apt-transport-https ca-certificates \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | cat > /etc/apt/sources.list.d/php.list \
    && apt update \
    && apt install -y php7.4 php7.4-fpm php7.4-mysql mariadb-client