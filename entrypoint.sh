# !/bin/sh

# return error 
set -e

# Substituting environament variables 
envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf

# Start NginX Service
nginx -g 'deamon off;'
