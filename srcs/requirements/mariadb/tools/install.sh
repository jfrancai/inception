#! /bin/bash

service mariadb start

# MySQL 8 and higher versions
commands="
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';
	FLUSH PRIVILEGES;

	CREATE DATABASE \`${NEW_DB_NAME}\`;
	CREATE USER '${NEW_USER}'@'${HOST}' IDENTIFIED BY '${NEW_DB_PASSWORD}';
	GRANT USAGE ON *.* TO '${NEW_USER}'@'${HOST}';
	GRANT ALL ON \`${NEW_DB_NAME}\`.* TO '${NEW_USER}'@'${HOST}';
	FLUSH PRIVILEGES;"

echo "${commands}" | /usr/bin/mysql -u root

service mariadb stop

mysqld
