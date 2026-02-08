#!/usr/bin/env bash
set -e

/usr/sbin/php-fpm8.5 -F -R -y /etc/php/8.5/php-fpm.conf &
caddy run -config /etc/Caddyfile &
wait -n
