#!/bin/sh

if [ "$TLS" == "true" ]; then
export PASS=https://$HOST
export ORIGIN=https://$HOST
else
export PASS=http://$HOST
export ORIGIN=http://$HOST
fi

if [ "$PROXY_REFERER" == "" ]; then
export PROXY_REFERER=$PASS
fi

envsubst '$ORIGIN,$PROXY_HOST,$PASS,$SERVER_NAME,$PROXY_REFERER' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/proxy.conf

nginx -g "daemon off;"