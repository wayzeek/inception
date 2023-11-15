FROM alpine:3.18

# Install MariaDB
RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

# Copy our custom MariaDB configuration file into the image
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Copy script to create database and user

COPY tools/configure.sh /tmp/configure.sh

# Launch script to create database and user

CMD ["sh", "/tmp/configure.sh"]