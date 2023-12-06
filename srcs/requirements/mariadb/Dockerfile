# Use the latest stable version of Debian as the base image
FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

# Open port
EXPOSE 3306

# Copy script to create database and user
COPY ./tools/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init.sql /tmp/
COPY ./tools/configure.sh ./configure.sh

# Give permission to execute the script
RUN chmod +x configure.sh

# Launch script to create database and user
ENTRYPOINT	["./configure.sh"]

# Start
CMD			["mysqld_safe"]