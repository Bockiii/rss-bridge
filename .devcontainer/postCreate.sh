sudo apt-get update
sudo apt-get install --yes --no-install-recommends \
      nginx \
      zlib1g-dev \
      libzip-dev \
      libmemcached-dev \
      nss-plugin-pem \
      libicu-dev
sudo docker-php-ext-install zip
sudo docker-php-ext-install intl
sudo pecl install memcached
sudo docker-php-ext-enable memcached
sudo docker-php-ext-enable opcache
sudo mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
sudo cp "$HOME/.devcontainer/xdebug.ini" "$PHP_INI_DIR/xdebug.ini"
sudo cp "$HOME/.devcontainer/nginx.conf" "/etc/nginx/sites-enabled/default"