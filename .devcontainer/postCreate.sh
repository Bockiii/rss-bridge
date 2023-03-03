cd /workspaces/rss-bridge

apt-get update && \
    apt-get install --yes --no-install-recommends \
      nginx \
      zlib1g-dev \
      libzip-dev \
      libmemcached-dev \
      nss-plugin-pem \
      gcc \
      make \
      autoconf \
      libc-dev \
      pkg-config \
      libicu-dev && \
    docker-php-ext-install zip && \
    docker-php-ext-install intl && \
    pecl install memcached && \
    docker-php-ext-enable memcached && \
    docker-php-ext-enable opcache && \
    mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
    
cp ./.devcontainer/nginx.conf /etc/nginx/sites-enabled/default
cp ./.devcontainer/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

nginx

php-fpm
