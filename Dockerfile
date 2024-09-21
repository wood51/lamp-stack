FROM php:8.2-apache

# Installation des extensions PHP nécessaires
RUN apt-get update && apt-get install -y \
    libmariadb-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-install mysqli pdo_mysql \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

RUN pecl install redis \
    && docker-php-ext-enable redis

# Activation des modules Apache
RUN a2enmod ssl
RUN a2enmod rewrite

# Activation du site SSL par défaut
RUN a2ensite default-ssl

# Copie de la configuration SSL personnalisée
# COPY ./conf/apache2/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
# COPY ./conf/php/php.ini-development /usr/local/etc/php/php.ini

# Commande de démarrage
CMD ["apache2-foreground"]
