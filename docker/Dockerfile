FROM php:8.1-apache

RUN docker-php-ext-install mysqli

# Copiar la aplicación a la imagen del contenedor
COPY . /var/www/html

# Establecer el directorio de trabajo
WORKDIR /var/www/html

# Configurar el servidor web de Apache para leer el archivo index.php en la carpeta public
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!/var/www/html/public!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Exponer el puerto 80 para que pueda ser accedido desde fuera del contenedor
EXPOSE 80