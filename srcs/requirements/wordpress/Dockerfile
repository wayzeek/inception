FROM debian:buster

EXPOSE	9000

#Update docker
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -y install wget && apt-get -y install curl
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client
RUN rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

#Setting up wordpress
RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN	mv wp-cli-2.7.0.phar /usr/bin/wp

COPY tools/auto_config.sh ./auto_config.sh
RUN chmod 777 ./auto_config.sh

CMD		["bash", "./auto_config.sh"]