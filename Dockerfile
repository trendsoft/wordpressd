FROM php:7.4.7-apache

RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libc-client-dev libkrb5-dev lib-zip-dev\
&& rm -r /var/lib/apt/lists/* \
&& pecl install mcrypt-1.0.3 redis xdebug \
&& docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
&& docker-php-ext-enable mcrypt redis \
&& docker-php-ext-install -j$(nproc) iconv && docker-php-ext-configure gd --with-freetype --with-jpeg \
&& docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql imap zip \
&& cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/