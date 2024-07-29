# syntax=docker/dockerfile:1

FROM composer:lts as deps

WORKDIR /app

COPY . .

RUN --mount=type=cache,target=/tmp/cache \
    composer install --no-dev --no-interaction

FROM php:8.1-apache as final

RUN apt-get update && apt-get install -y \
    libfreetype-dev \
    libjpeg62-turbo-dev \
    libpng-dev && \
    pecl install redis-5.3.7 && \
    pecl install xdebug-3.2.1 && \
    pecl install mongodb-1.19.3 && \
    docker-php-ext-enable redis xdebug mongodb

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY --from=deps /app /var/www/html

# Configurar o Apache para servir a aplicação Laravel
RUN cat > /etc/apache2/sites-available/000-default.conf <<EOF
<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /var/www/html/public
    <Directory /var/www/html/public>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
        DirectoryIndex index.php
    </Directory>
</VirtualHost>
EOF

# Habilitar o módulo de reescrita do Apache
RUN a2enmod rewrite

# Ajuste de permissões
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

WORKDIR /var/www/html

RUN cp .env.example .env
RUN php artisan key:generate

EXPOSE 80

CMD ["apache2-foreground"]
