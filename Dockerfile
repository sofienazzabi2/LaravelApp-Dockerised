# Use the official PHP image as base
FROM php:8.1-fpm

# Set the working directory in the container
WORKDIR /var/www/html

# Install PHP extensions and dependencies
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libzip-dev \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy composer.lock and composer.json
COPY composer.lock composer.json ./

# Install project dependencies
RUN composer install --no-interaction --no-scripts --no-autoloader

# Copy all files from the current directory to the working directory in the container
COPY . .

# Run Composer dump-autoload to generate optimized autoloader
RUN composer dump-autoload --no-scripts --no-dev --optimize

# Expose port 9000 to the outside
EXPOSE 9000

# Command to run the application
CMD ["php-fpm"]
