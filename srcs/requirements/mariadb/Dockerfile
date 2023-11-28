# Use the latest stable version of Debian as the base image
FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

# Copy our custom MariaDB configuration file into the image
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Copy script to create database and user

COPY tools/configure.sh /tmp/configure.sh

# Launch script to create database and user

CMD ["sh", "/tmp/configure.sh"]