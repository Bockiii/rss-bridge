cd /workspaces/rss-bridge

sudo apt-get update
sudo apt-get install --yes --no-install-recommends \
      nginx \
      zlib1g-dev \
      libzip-dev \
      nss-plugin-pem \
      libicu-dev && \
docker-php-ext-install zip && \
docker-php-ext-install intl && \
docker-php-ext-enable opcache && \
sudo mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
#sudo cp ./.devcontainer/nginx.conf /etc/nginx/sites-enabled/default
sudo cp ./.devcontainer/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

sudo apache2ctl start
