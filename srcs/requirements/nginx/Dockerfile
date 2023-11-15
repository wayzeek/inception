# Use the latest stable version of Alpine as the base image
FROM alpine:3.18

# Install NGINX
RUN apk update && apk upgrade && apk add --no-cache nginx

# Create a repository for SSL certificates

RUN mkdir -p /etc/nginx/ssl

# Install OpenSSL

RUN apk add --no-cache openssl

# Generate a self-signed SSL certificate

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=FR/ST=Lyon/L=Lyon/O=Ecole42/OU=42Lyon/CN=localhost" \
    -keyout /etc/nginx/ssl/localhost.key \
    -out /etc/nginx/ssl/localhost.crt

# Create a repository for NGINX configuration files
RUN mkdir -p /var/run/nginx

# Copy our custom NGINX configuration file into the image
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Give permissions to the NGINX configuration files

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Start NGINX when the container launches
CMD ["nginx", "-g", "daemon off;"]
