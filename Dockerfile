FROM php:8.2.17-apache-bullseye

RUN apt-get update -y
RUN apt-get upgrade -y

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
RUN export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; nvm install v20.17.0

RUN apt-get install -y --no-install-recommends unzip p7zip-full && \
    rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install pdo_mysql

COPY docker/apache-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
CMD ["apache2-foreground"]

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY docker/php-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
COPY docker/php-error_reporting.ini /usr/local/etc/php/conf.d/error_reporting.ini