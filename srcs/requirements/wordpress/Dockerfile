# Use the latest stable version of Debian as the base image
FROM debian:buster

# Install wget
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget

# Install PHP & MySQL
RUN apt-get install -y php7.3 \
                       php-fpm \
                       php-mysqli \
                       mariadb-client \
                       wget \
                       curl

# Install WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# Unzip WordPress
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# Copy our custom PHP configuration file into the image
COPY conf/www.conf /etc/php/7.3/fpm/pool.d

# Install WordPress CLI

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make WordPress CLI executable

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Expose port 9000 to the Docker host, so we can access it

EXPOSE 9000

# Copy our WordPress configuration script into the image
COPY ./tools/auto_config.sh /tmp/auto_config.sh

# Make our WordPress configuration script executable

RUN chmod +x /tmp/auto_config.sh

# Execute our WordPress configuration script

ENTRYPOINT [ "/tmp/auto_config.sh" ]

# Start PHP-FPM

CMD ["php-fpm7.3", "--nodaemonize"]