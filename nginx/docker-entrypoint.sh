#!/bin/sh
set -e

if [ "$1" = 'nginx' -a "$(id -u)" = '0' ]; then
    touch /var/run/nginx.pid
    touch /var/run/nginx.lock
    chown -R nginx:nginx /etc/nginx /var/run/nginx.pid /var/run/nginx.lock /tmp
    exec su-exec nginx:nginx "$@"
fi

exec "$@"