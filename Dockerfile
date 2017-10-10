FROM webplates/symfony-php:7.0.11-fpm-alpine
RUN composer self-update
RUN composer create-project lucciano/symfony . --no-scripts --no-progress --stability=dev

