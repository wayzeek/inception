#!/bin/bash

# Terminate the script if an error occured
set -e

mysqld_safe &

# Safe install of MySQL
if [ ! -d "/var/lib/mysql/$WP_TITLE" ]
then
  # Generate the database and the user with privilege for WordPress
  mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $WP_TITLE;"
  mysql -uroot -e "CREATE USER IF NOT EXISTS '$WP_USER_LOGIN'@'%' IDENTIFIED BY '$WP_USER_PASSWORD';"
  mysql -uroot -e "GRANT ALL PRIVILEGES ON $WP_TITLE.* TO '$WP_USER_LOGIN'@'%';"
  mysql -uroot -e "FLUSH PRIVILEGES;"
  mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"
fi

exec "$@"