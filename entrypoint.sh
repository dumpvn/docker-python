#!/bin/bash

set -euxo pipefail

# shellcheck disable=SC2016
envsubst '${APP_USER} ${NGINX_WORKER}' < /etc/nginx/nginx.conf | sponge /etc/nginx/nginx.conf
# envsubst '${APP_USER} ${APP_HOME}' < /etc/supervisor/conf.d/uwsgi.conf | sponge /etc/supervisor/conf.d/uwsgi.conf
# envsubst '${SERVICE} ${APP_HOME}' < /etc/nginx/conf.d/www.conf | sponge /etc/nginx/conf.d/www.conf


exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
