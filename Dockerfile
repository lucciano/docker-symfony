FROM webplates/symfony-php:7.0.11-fpm-alpine
RUN composer self-update
RUN composer create-project symfony/framework-standard-edition . "3.3" --no-scripts --no-progress
