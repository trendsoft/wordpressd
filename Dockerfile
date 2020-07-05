FROM php:7.4.7-apache

RUN apt-get update && apt-get install -y libzip-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libc-client-dev libkrb5-dev imap-dev openssl-dev \
&& rm -r /var/lib/apt/lists/* \
&& docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
&& pecl install mcrypt-1.0.3 redis xdebug \
&& docker-php-ext-enable mcrypt redis \
&& docker-php-ext-install -j$(nproc) iconv && docker-php-ext-configure gd --with-freetype --with-jpeg \
&& docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql zip imap \
&& cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/