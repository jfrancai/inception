FROM debian:11-slim

ARG NEW_USER
ARG ROOT_PASSWORD
ARG NEW_DB_PASSWORD
ARG NEW_DB_NAME
ARG HOST

RUN apt-get update && \
    apt-get install -y mariadb-server

RUN service mariadb start && commands=" \
		ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}'; \
		CREATE DATABASE \`${NEW_DB_NAME}\`; \
		CREATE USER '${NEW_USER}'@'${HOST}' IDENTIFIED BY '${NEW_DB_PASSWORD}'; \
		GRANT USAGE ON *.* TO '${NEW_USER}'@'${HOST}'; \
		GRANT ALL ON \`${NEW_DB_NAME}\`.* TO '${NEW_USER}'@'${HOST}'; \
		FLUSH PRIVILEGES;" && \
	echo "${commands}" | /usr/bin/mysql -u root;

RUN mkdir -p /var/run/mysqld; \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld; \
	chmod 777 /var/run/mysqld;

RUN sed -i -e 's/# port = 3306/port = 3306/' -e 's/^socket =/#/' /etc/mysql/my.cnf; \
	sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf;

EXPOSE 3306
ENTRYPOINT ["mysqld"]
