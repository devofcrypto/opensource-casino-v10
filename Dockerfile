FROM php:8.1-apache

# تثبيت مكتبات ضرورية و composer
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev zip unzip git curl && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# نسخ المشروع
COPY . /var/www/html
WORKDIR /var/www/html

# تشغيل composer install
RUN composer install --no-interaction --optimize-autoloader

# تغيير صلاحيات التخزين والكوكيز
RUN chown -R www-data:www-data storage bootstrap/cache

EXPOSE 80

CMD ["apache2-foreground"]

