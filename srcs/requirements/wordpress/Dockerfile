# Use the latest stable version of Alpine as the base image
FROM alpine:3.18

# Install PHP-FPM
RUN apk add --no-cache php8-fpm php8-opcache php8-mysqli php8-gd php8-curl php8-zlib php8-dom

# Install WordPress
RUN apk add --no-cache wordpress

# Remove the default PHP FPM configuration file
RUN rm /etc/php8/php-fpm.d/www.conf

# Copy our custom PHP FPM configuration file into the image
COPY ./conf/php-fpm.conf /etc/php8/php-fpm.d/www.conf

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM when the container launches
CMD ["php-fpm8", "-F"]