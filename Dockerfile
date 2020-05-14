FROM druidfi/php:7.3-fpm

COPY composer.* /app/

RUN composer install --no-dev

COPY conf/wp-config.php /app/public/wp-config.php
