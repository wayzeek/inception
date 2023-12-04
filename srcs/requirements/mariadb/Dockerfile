# Use the latest stable version of Debian as the base image
FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

# Copy script to create database and user
COPY tools/configure.sh configure.sh

# Give permission to execute the script
RUN chmod +x configure.sh

# Open port
EXPOSE 3306

# Launch script to create database and user
ENTRYPOINT ["./configure.sh"]