#! /bin/bash

newUser='jfrancai'
newDbPassword='jfrancai42'
newDb='inceptiondb'
host=172.18.1.4

# MySQL 8 and higher versions
commands="CREATE DATABASE \`${newDb}\`;CREATE USER '${newUser}'@'${host}' IDENTIFIED BY '${newDbPassword}';GRANT USAGE ON *.* TO '${newUser}'@'${host}';GRANT ALL ON \`${newDb}\`.* TO '${newUser}'@'${host}';FLUSH PRIVILEGES;"

echo "${commands}" | /usr/bin/mysql -u root
