FROM debian:11-slim
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
	php-fpm

RUN mkdir -p /run/php /var/www/html && \
	\
	sed -i \
	-e 's/^listen = .*/listen = 172.18.1.3:9000/' \
	/etc/php/7.4/fpm/pool.d/www.conf && \
	\
	echo "<?php phpinfo(); ?>" >> /var/www/html/index.php

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F", "-R"]
