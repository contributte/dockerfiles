#!/usr/bin/env bash
set -e

/usr/sbin/php-fpm7.4 -F -R -y /etc/php/7.4/php-fpm.conf &
caddy run -config /etc/Caddyfile &
wait -n