FROM debian:11-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
	curl \
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
	sed -i -e 's/^listen = .*/listen = wordpress:9000/' /etc/php/7.4/fpm/pool.d/www.conf;

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	chmod +x wp-cli.phar; \
	mv wp-cli.phar /usr/local/bin/wp; \
	wp core download --allow-root --path=/var/www/html/wordpress --force;

RUN chmod -R 755 /var/www/html/wordpress; \
	chown -R www-data.www-data /var/www/html/wordpress;

COPY ./tools/install.sh /
EXPOSE 9000

ENTRYPOINT ["./install.sh"]
