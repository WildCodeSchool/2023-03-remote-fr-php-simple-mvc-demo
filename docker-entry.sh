#!/usr/bin/env bash
set -e

composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist \
    --quiet

php /var/www/migration.php

mkdir /var/www/public/uploads
chmod 775 /var/www/public/uploads

php-fpm -D
nginx -g 'daemon off;'
