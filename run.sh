#!/bin/sh

if [ "$TLS" == "true" ]; then
export PASS=https://$HOST
export ORIGIN=https://$HOST
else
export PASS=http://$HOST
export ORIGIN=http://$HOST
fi

if [ "$REFERER" == "" ]; then
export REFERER=$PASS
fi

envsubst '$ORIGIN,$HOST,$PASS,$SERVER_NAME,$REFERER' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/proxy.conf

nginx -g "daemon off;"