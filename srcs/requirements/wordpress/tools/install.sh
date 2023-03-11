#!/bin/bash

echo "Configuring Wordpress...";
wp config create --allow-root --path=/var/www/html/wordpress --dbname=${DBNAME} --dbuser=${DBUSER} --dbpass=${DBPASS} --dbhost=${DBHOST}
echo "Installing Wordpress...";
wp core install --allow-root --path=/var/www/html/wordpress --url=${URL} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --skip-email
#echo " Wordpress create new user...";
wp user create $USER $EMAIL --user_pass=$PASSWORD --role=author --allow-root --path=/var/www/html/wordpress

exec /usr/sbin/php-fpm7.4 -F -R
