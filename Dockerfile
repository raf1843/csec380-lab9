FROM php:7.4-apache

# Copy files into document root
COPY LimeSurvey /var/www/html
RUN chown -R www-data:www-data /var/www
RUN chmod -R +rw /var/www/html/tmp
RUN chmod -R +rw /var/www/html/upload
RUN chmod -R +rw /var/www/html/application/config

# install extension for LimeSurvey
RUN apt-get update
RUN apt-get install -y libonig-dev
RUN docker-php-ext-install pdo_mysql mbstring

RUN apachectl restart
