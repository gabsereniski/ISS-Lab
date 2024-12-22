FROM php:5.6-apache

# Ajustar os repositórios para versões arquivadas e remover os inválidos
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99no-check-valid-until && \
    apt-get update && \
    apt-get install -y wget && \
    docker-php-ext-install mysqli pdo_mysql && \
    apt-get install -y openssl


# Copiar certificados SSL e configurações do Apache
COPY ssl/server.crt /etc/ssl/certs/server.crt
COPY ssl/server.key /etc/ssl/private/server.key
COPY ssl/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ssl/000-default-ssl.conf /etc/apache2/sites-available/000-default-ssl.conf

# Habilitar módulos do Apache
RUN a2enmod ssl rewrite
RUN a2ensite 000-default
RUN a2ensite 000-default-ssl

# Definir o diretório de trabalho
WORKDIR /var/www/html
