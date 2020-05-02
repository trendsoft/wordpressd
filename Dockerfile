FROM php:7.3.17-apache

RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev \
&& pecl install mcrypt-1.0.2 \
&& docker-php-ext-enable mcrypt \
&& docker-php-ext-install -j$(nproc) iconv && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql \
&& cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/