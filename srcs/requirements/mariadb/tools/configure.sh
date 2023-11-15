#!/bin/sh

# Start MariaDB

service mysql start

# Create database

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create user

mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Grant privileges

mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Change root privileges

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Flush privileges

mysql -e "FLUSH PRIVILEGES;"

# Stop MariaDB

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Start MariaDB 

exec mysqld_safe


