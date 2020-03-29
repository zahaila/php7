#!/bin/bash

#if [ ! -f /.initialized ]; then
  #/run/certs.sh
  #/run/configs.sh

  #touch /.initialized
#fi

figlet "php $(php-config --version)"
php -v
#nginx -v
printf "\n"
if [ -d /etc/php/${php_version}/conf.d ] && [ -f /etc/php/${php_version}/php-cli.ini ];then
  printf "%20s: %s\n" "php ini conf path" "/etc/php/${php_version}/conf.d/php-cli.ini"
else
  printf "%20s: diretório de conf incorreto"
fi
if [ -d /etc/php/${php_version}/fpm ] && [ -f /etc/php/${php_version}/fpm/php.ini ];then
  printf "%20s: %s\n" "php-fpm conf path" "/etc/php/${php_version}/fpm/php.ini"
else
  printf "%20s: diretório de conf fpm incorreto"
fi
#printf "%20s: %s\n" "nginx conf path" "/etc/nginx/conf.d"
#printf "%20s: %s\n" "document root" "/usr/share/nginx/html"
printf "%20s  %s\n" "" "set volumes appropriately"
printf "\n"

echo "command=/usr/sbin/php-fpm --fpm-config /etc/php/${php_version}/fpm/php-fpm.conf --pid /run/php-fpm.pid -F">>/run/supervisord.conf
cp /run/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#forego start -f /run/Procfile
