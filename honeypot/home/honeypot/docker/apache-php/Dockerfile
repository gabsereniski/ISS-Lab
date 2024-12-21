FROM php:5.6-apache 
# Versão antiga e desatualizada do PHP

# Instalar extensões necessárias para MySQL
RUN apt-get update && apt-get install -y wget \
    && docker-php-ext-install mysqli pdo_mysql

# Configuração insegura de PHP
RUN echo "display_errors=On" >> /usr/local/etc/php/php.ini
RUN echo "error_reporting=E_ALL" >> /usr/local/etc/php/php.ini
RUN echo "allow_url_fopen=On" >> /usr/local/etc/php/php.ini # Permitir fopen remoto
RUN echo "disable_functions=" >> /usr/local/etc/php/php.ini # Nenhuma função desabilitada

# Adicionar diretórios inseguros para testes
RUN mkdir /var/www/html/uploads && chmod 777 /var/www/html/uploads
RUN mkdir /var/www/html/backup && chmod 777 /var/www/html/backup

# Expor informações sensíveis como teste
RUN echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

# Definir diretório de trabalho
WORKDIR /var/www/html
