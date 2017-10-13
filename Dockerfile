FROM php:7-apache

RUN apt-get update && apt-get install -yq libzip-dev git && \
    pecl install zip && \
    docker-php-ext-enable zip 
	
RUN  docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install pdo pdo_mysql


RUN sed -i '/DocumentRoot/c\\tDocumentRoot /var/www/html/web' /etc/apache2/sites-enabled/000-default.conf

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

RUN composer create-project lucciano/symfony --no-scripts --no-progress --stability=dev .

RUN chown www-data:www-data -R var/
