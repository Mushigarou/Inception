#!/bin/bash

sleep 10
service php7.4-fpm start

    wp core download --allow-root --path=/var/www/wordpress
    sleep 2
    cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
    sed -i "s/database_name_here/${SQL_DATABASE}/" /var/www/wordpress/wp-config.php
    sed -i "s/username_here/${SQL_USER}/" /var/www/wordpress/wp-config.php
    sed -i "s/password_here/${SQL_PASSWORD}/" /var/www/wordpress/wp-config.php
    sed -i "s/localhost/${SQL_HOST}/" /var/www/wordpress/wp-config.php

    wp core install  --allow-root --url=$DOMAIN_NAME --title=$TITLE --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --path=/var/www/wordpress 
    wp user create --path=/var/www/wordpress $USER_NAME $USER_EMAIL --user_pass=$USER_PASS --allow-root

sleep 1
service php7.4-fpm stop

echo php starts

/usr/sbin/php-fpm7.4  -F
