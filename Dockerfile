FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    unzip zip curl git libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libzip-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip gd

# Apache + index.php + mod_rewrite
RUN a2enmod rewrite
RUN echo "DirectoryIndex index.php index.html" > /etc/apache2/conf-available/yourls.conf && \
    a2enconf yourls

# Changer le port écouté par Apache (important pour Render)
ENV PORT=8080
RUN sed -i "s/80/\${PORT}/g" /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Copier YOURLS
WORKDIR /var/www/html
RUN rm -rf * && curl -L https://github.com/YOURLS/YOURLS/archive/refs/heads/master.zip -o yourls.zip \
    && unzip yourls.zip && mv YOURLS-master/* . && rm -rf yourls.zip YOURLS-master

RUN chown -R www-data:www-data /var/www/html
