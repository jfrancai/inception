FROM debian:11-slim

ARG NEW_USER
ARG NEW_DB_PASSWORD
ARG NEW_DB_NAME
ARG NEW_HOST

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
	wget \
	php-fpm \
	php-mysql \
	php-curl \
	php-gd \
	php-intl \
	php-mbstring \
	php-soap \
	php-xml \
	php-xmlrpc \
	php-zip \
	mariadb-client

RUN mkdir -p /run/php /var/www/html; \
	sed -i -e 's/^listen = .*/listen = 172.18.1.3:9000/' /etc/php/7.4/fpm/pool.d/www.conf; \
	wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz; \
	cd /var/www/html; \
	rm -rf *; \
	tar -xzf /tmp/wordpress.tar.gz

COPY ./conf/wp-config.php /var/www/html/wordpress/

RUN sed -i -e "s/NEW_DB_NAME/${NEW_DB_NAME}/" \
	-e "s/NEW_USER/${NEW_USER}/" \
	-e "s/NEW_DB_PASSWORD/${NEW_DB_PASSWORD}/" \
	-e "s/NEW_HOST/${NEW_HOST}/" \
	/var/www/html/wordpress/wp-config.php

RUN chmod -R 755 /var/www/html/wordpress; \
	chown -R www-data.www-data /var/www/html/wordpress

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F", "-R"]
