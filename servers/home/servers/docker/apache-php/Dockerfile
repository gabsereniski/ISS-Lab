FROM php:8.1-apache

# Instalar extensões necessárias para MySQL e SSL
RUN apt-get update && apt-get install -y openssl \
    && docker-php-ext-install mysqli pdo_mysql

# Copiar certificados SSL e configuração
COPY ssl/server.crt /etc/ssl/certs/server.crt
COPY ssl/server.key /etc/ssl/private/server.key
COPY ssl/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ssl/000-default-ssl.conf /etc/apache2/sites-available/000-default-ssl.conf

# Habilitar módulos SSL e Rewrite
RUN a2enmod ssl rewrite
RUN a2ensite 000-default
RUN a2ensite 000-default-ssl

# Definir diretório de trabalho
WORKDIR /var/www/html
