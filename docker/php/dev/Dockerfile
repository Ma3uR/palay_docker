ARG PHP_VERSION
ARG COMPOSER_VERSION

FROM composer:${COMPOSER_VERSION} AS composer-image
FROM php:8.0-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Install dependencies and PHP extensions
RUN apt-get update && \
    apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        unzip \
        curl \
        git \
    && docker-php-ext-install -j$(nproc) iconv gd zip pdo_mysql \
    && a2enmod rewrite \
    && service apache2 restart

# Install Node.js 16.x
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js (required for Shopware 6 administration)
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs

# Optionally, you can set PHP configuration if needed
# COPY php.ini /usr/local/etc/php/conf.d/

# Copy the Shopware 6 files into the container
COPY . .

# Install Shopware 6 dependencies and set up the application
RUN composer install --no-interaction --optimize-autoloader

# Expose the port that Apache will run on
EXPOSE 80

# Start Apache when the container starts
CMD ["apache2-foreground"]
