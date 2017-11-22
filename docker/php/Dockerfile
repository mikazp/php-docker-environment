FROM php:7.1-fpm
# install xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug
# install opcache
RUN docker-php-ext-install opcache && docker-php-ext-enable opcache
# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
# create user
ARG UID
RUN adduser --disabled-password --gecos "" --home /home/dev --uid ${UID} dev > /dev/null
USER dev
# change workidir
WORKDIR /var/www