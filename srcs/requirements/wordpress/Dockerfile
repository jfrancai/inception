FROM debian:11-slim
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

RUN mkdir -p /run/php /var/www/html && \
	\
	sed -i -e 's/^listen = .*/listen = 172.18.1.3:9000/' \
		/etc/php/7.4/fpm/pool.d/www.conf && \
	\
	wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
	\
	cd /var/www/html && \
	\
	rm -rf * && \
	\
	tar -xzf /tmp/wordpress.tar.gz && \
	\
	chmod -R 755 /var/www/html/wordpress && \
	\
	chown -R www-data.www-data /var/www/html/wordpress


EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F", "-R"]
