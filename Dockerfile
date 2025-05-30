# Base image avec PHP et Apache
FROM php:8.1-apache

# Installe les extensions PHP nécessaires
RUN apt-get update && apt-get install -y \
    unzip zip curl git rsync libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libzip-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip gd

# Active mod_rewrite pour YOURLS
RUN a2enmod rewrite

# Configure Apache pour supporter index.php
RUN echo "DirectoryIndex index.php index.html" > /etc/apache2/conf-available/yourls.conf \
    && a2enconf yourls

# Corrige le port pour Render
ENV PORT=8080
RUN sed -i "s/80/\${PORT}/g" /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Déploie YOURLS proprement
WORKDIR /var/www/html
RUN rm -rf * && \
    curl -L https://github.com/YOURLS/YOURLS/archive/refs/heads/master.zip -o yourls.zip && \
    unzip yourls.zip && \
    rsync -a YOURLS-master/ . && \
    rm -rf yourls.zip YOURLS-master

# Droits fichiers
RUN chown -R www-data:www-data /var/www/html
