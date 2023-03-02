apt-get update && \
    apt-get install --yes --no-install-recommends \
      nginx \
      zlib1g-dev \
      libzip-dev \
      libmemcached-dev \
      nss-plugin-pem \
      libicu-dev && \
    docker-php-ext-install zip && \
    docker-php-ext-install intl && \
    pecl install memcached && \
    docker-php-ext-enable memcached && \
    docker-php-ext-enable opcache && \
    mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

cp "$HOME/.devcontainer/xdebug.ini" "$PHP_INI_DIR/xdebug.ini"
cp "$HOME/config/nginx.conf" "/etc/nginx/sites-enabled/default"