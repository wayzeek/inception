FROM debian:buster

# Open port 9000
EXPOSE	9000

#Update docker
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -y install wget && apt-get -y install curl
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

# Copy configuration file for PHP-FPM
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Installing 
RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN	mv wp-cli-2.7.0.phar /usr/bin/wp

# Copy configiruation script for wordpress
COPY tools/auto_config.sh ./auto_config.sh
RUN chmod 777 ./auto_config.sh

CMD		["bash", "./auto_config.sh"]