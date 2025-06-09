FROM php:8.1-apache

# تثبيت الأدوات الضرورية
RUN apt-get update && apt-get install -y \
    git unzip curl zip libzip-dev libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo_mysql zip gd

# تثبيت Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# نسخ الملفات إلى مجلد Apache
COPY . /var/www/html

WORKDIR /var/www/html

# تثبيت الاعتمادات (dependencies)
RUN composer install --no-interaction --optimize-autoloader

# صلاحيات الملفات
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80

CMD ["apache2-foreground"]
