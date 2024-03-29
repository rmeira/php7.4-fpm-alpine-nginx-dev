FROM rmeiradev/php7.4-fpm-alpine-nginx

# Install prerequisites required for tools and extensions installed later on.
RUN apk add --update nodejs npm vim

# Install required PHP extensions and all their prerequisites available via apt.
RUN chmod uga+x /usr/bin/install-php-extensions \
    && sync \
    && install-php-extensions xdebug

COPY ./php/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini