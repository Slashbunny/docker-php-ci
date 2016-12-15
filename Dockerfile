FROM php:latest

# Update and Install Packages
RUN apt-get update -y && apt-get install -y \
    ant \
    curl \
    git \
    libcurl4-gnutls-dev \
    libxslt1-dev \
    libxslt1.1 \
    unzip \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP Modules
RUN docker-php-ext-install \
    curl \
    json \
    xsl \
    zip

# Install Composer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
    && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1);  }" \
    && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer \
    && rm /tmp/composer-setup.php

