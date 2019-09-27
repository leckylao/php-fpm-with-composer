FROM php:7.2-fpm
RUN apt-get update && apt-get install -y \
    git \
    libzip-dev \
    zip \
    unzip
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install pdo_mysql zip

# Install PHP Composer
# Replaced with docker run --rm -v $(pwd)/:/app composer install
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Remove Cache
RUN rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /var/www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
