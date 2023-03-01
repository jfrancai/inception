FROM debian:11-slim
RUN apt-get update && apt-get upgrade -y
RUN rm -rf /var/lib/apt/lists/* 
RUN apt-get update && apt-get install -y \
	build-essential \
	pkg-config \
	libxml2-dev \
	libsqlite3-dev \
	zlib1g-dev \
	wget

RUN wget https://www.php.net/distributions/php-8.2.3.tar.gz -O php-8.2.3 && \
	tar xzf php-8.2.3

RUN cd php-8.2.3 && \
	./configure --enable-fpm --with-mysqli && \
	make && \
	make install

RUN cp /php-8.2.3/php.ini-development /usr/local/php/php.ini
RUN cp /usr/local/etc/php-fpm.d/www.conf.default \
	/usr/local/etc/php-fpm.d/www.conf

RUN cp /php-8.2.3/sapi/fpm/php-fpm /usr/local/bin
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /usr/local/php/php.ini
RUN sed -i -e 's/^listen = .*/listen = 9000/' -e 's/^user = .*/user = www-data/' -e 's/^group = .*/group = www-data/' /usr/local/etc/php-fpm.d/www.conf
RUN cp /usr/local/etc/php-fpm.conf* /usr/local/etc/php-fpm.conf
RUN sed -i -e 's/^include=.*/include=\/usr\/local\/etc\/php-fpm.d\/\*\.conf/' /usr/local/etc/php-fpm.conf

RUN mkdir -p /var/www/html && echo "<?php phpinfo(); ?>" >> /var/www/html/index.php

EXPOSE 9000

CMD ["/usr/local/bin/php-fpm", "-F", "-R"]
