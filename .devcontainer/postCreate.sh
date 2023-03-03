sudo apt-get update
sudo apt-get install --yes --no-install-recommends \
      nginx \
      zlib1g-dev \
      libzip-dev \
      libmemcached-dev \
      nss-plugin-pem \
      libicu-dev
sudo export APACHE_DOCUMENT_ROOT=/workspaces/rss-bridge
sudo docker-php-ext-install zip
sudo docker-php-ext-install intl
sudo pecl install memcached
sudo docker-php-ext-enable memcached
sudo docker-php-ext-enable opcache
sudo mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
sudo cp "/workspaces/rss-bridge/.devcontainer/xdebug.ini" "$PHP_INI_DIR/xdebug.ini"
sudo sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
sudo sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf