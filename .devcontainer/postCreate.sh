# sudo apt-get update
# sudo apt-get install --yes --no-install-recommends \
#       nginx \
#       zlib1g-dev \
#       libzip-dev \
#       libmemcached-dev \
#       nss-plugin-pem \
#       libicu-dev
# sudo export APACHE_DOCUMENT_ROOT=/workspaces/rss-bridge
# sudo docker-php-ext-install zip
# sudo docker-php-ext-install intl
# sudo pecl install memcached
# sudo docker-php-ext-enable memcached
# sudo docker-php-ext-enable opcache
sudo chmod a+x \"$(pwd)\" && sudo rm -rf /var/www/html && sudo ln -s \"$(pwd)\" /var/www/html
sudo mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
sudo cp "/workspaces/rss-bridge/.devcontainer/xdebug.ini" "$PHP_INI_DIR/xdebug.ini"