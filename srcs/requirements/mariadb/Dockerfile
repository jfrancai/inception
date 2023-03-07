FROM debian:11-slim

RUN apt-get update && \
    apt-get install -y mariadb-server

COPY tools/install.sh /

RUN sed -i -e 's/127.0.0.1/0.0.0.0/' \
	/etc/mysql/mariadb.conf.d/50-server.cnf && \
	mkdir -p /var/run/mysqld/ /run/mysqld && \
	chown -R mysql:root /run/mysqld

EXPOSE 3306

CMD ["mysqld"]
