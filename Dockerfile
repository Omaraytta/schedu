FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libssl-dev \
    && docker-php-ext-install pdo pdo_mysql zip mbstring exif pcntl bcmath gd opcache \
    && a2enmod rewrite

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

COPY . /var/www/html

RUN echo "ServerName schedu.site" >> /etc/apache2/apache2.conf

RUN composer install

RUN chown -R www-data:www-data /var/www/html/storage \
    && chmod -R 775 /var/www/html/storage \
    && chmod -R 775 /var/www/html/bootstrap/cache

COPY docker/php/php.ini /usr/local/etc/php/conf.d/app.ini

WORKDIR /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]

