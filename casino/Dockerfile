FROM php:8.1-apache

# نسخ الملفات للمجلد الذي يعمل فيه Apache
COPY . /var/www/html/

# تفعيل mod_rewrite لـ Apache
RUN a2enmod rewrite

# إعدادات صلاحيات بسيطة
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

EXPOSE 80

