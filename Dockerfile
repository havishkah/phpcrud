FROM nginx

# Install PHP and other dependencies
RUN apt-get update \
    && apt-get install -y php-fpm php-mysql mysql-client

# Copy PHP files to the appropriate directory
COPY . /usr/share/nginx/html

# Import the database file
COPY database.sql /docker-entrypoint-initdb.d/database.sql

# Start PHP-FPM and Nginx
CMD service php7.4-fpm start && nginx -g 'daemon off;'