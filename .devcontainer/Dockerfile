FROM rssbridge/rss-bridge:latest

RUN  apt-get update && \
    apt-get install --yes --no-install-recommends \
      git \
      php-dev \
      php-xdebug && \
    pear install PHP_CodeSniffer
