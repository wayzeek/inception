#!/bin/sh

sed -i 's|MYSQL_DATABASE|'${SQL_DATABASE}'|g' /tmp/init.sql
sed -i 's|MYSQL_USER|'${SQL_USER}'|g' /tmp/init.sql
sed -i 's|MYSQL_PASSWORD|'${SQL_PASSWORD}'|g' /tmp/init.sql
sed -i 's|MYSQL_ROOT_PASSWORD|'${SQL_ROOT_PASSWORD}'|g' /tmp/init.sql
sed -i 's|MYSQL_PORT|'3306'|g' /etc/mysql/my.cnf
sed -i 's|MYSQL_ADDRESS|'0.0.0.0'|g' /etc/mysql/my.cnf


if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

mysql_install_db --datadir=/var/lib/mysql
mysqld --user=root --init-file="/tmp/init.sql"

exec "$@"