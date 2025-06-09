# استخدام صورة PHP مع Apache
FROM php:8.1-apache

# تثبيت التمديدات المطلوبة
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev zip unzip git curl && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql

# نسخ ملفات المشروع إلى الحاوية
COPY . /var/www/html

# تعيين مجلد العمل
WORKDIR /var/www/html

# تثبيت Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# تثبيت الاعتماديات باستخدام Composer
RUN composer install --no-interaction --optimize-autoloader

# تعيين الأذونات المناسبة
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# فتح المنفذ 80
EXPOSE 80

# بدء Apache
CMD ["apache2-foreground"]
