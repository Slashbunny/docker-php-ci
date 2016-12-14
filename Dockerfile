FROM php:latest

# Update and Install Packages
RUN apt-get update -y && apt-get install -y \
    ant \
    git \
    libxslt1-dev \
    libxslt1.1 \
    && rm -rf /var/lib/apt/lists/*

# Install PHP Modules
RUN docker-php-ext-install xsl

