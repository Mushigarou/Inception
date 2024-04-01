#!/bin/bash

sleep 10

# if [ -e  /var/www/wordpress/wp-config.php ]
# then
#     rm /var/www/wordpress/wp-config.php
# fi

# if ! [ -e  /var/www/wordpress/wp-config.php ]
# then
#     wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
# fi

# mv /var/www/wordpress/ /var/www/html 

if ! test -e  /run/php/php7.4-fpm.pid
then
    mkdir /run/php && touch /run/php/php7.4-fpm.pid
fi

sleep 1
echo php starts

/usr/sbin/php-fpm7.4  -F
