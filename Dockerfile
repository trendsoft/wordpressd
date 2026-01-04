FROM php:8.5-rc-apache

RUN apt update && apt install -y libzip-dev zlib1g-dev libpng-dev libmagickwand-dev cron supervisor \
&& rm -rf /var/lib/apt/lists/*

RUN pecl install redis imagick xdebug

RUN docker-php-ext-install gd bcmath zip mysqli pdo_mysql gettext calendar exif intl

RUN docker-php-ext-enable redis imagick

RUN cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/
