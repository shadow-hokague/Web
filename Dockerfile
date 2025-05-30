FROM php:8.1-apache

# Installer les extensions nécessaires
RUN apt-get update && apt-get install -y \
    unzip zip curl git libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libzip-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip gd

# Activer mod_rewrite pour Apache
RUN a2enmod rewrite

# Copier les fichiers de YOURLS
WORKDIR /var/www/html
RUN rm -rf *
RUN curl -L https://github.com/YOURLS/YOURLS/archive/refs/heads/master.zip -o yourls.zip \
    && unzip yourls.zip && mv YOURLS-master/* . && rm -rf yourls.zip YOURLS-master

# Droits
RUN chown -R www-data:www-data /var/www/html
