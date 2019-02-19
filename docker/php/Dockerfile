FROM php:7.2-fpm
# install required libs & tools
RUN apt-get update && apt-get install -y git zlib1g-dev
# install php zip extension
RUN docker-php-ext-install zip
# install xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug
# configure xdebug
RUN echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
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