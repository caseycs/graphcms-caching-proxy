#!/bin/sh -e

if [ -z "$ENDPOINT" ]
then
  echo "Please define ENDPOINT environment variable";
  exit 1;
fi

sed -i 's~__ENDPOINT__~'"$ENDPOINT"'~g' /etc/nginx/conf.d/default.conf
sed -i 's~__PROXY_CACHE_VALID__~'"$PROXY_CACHE_VALID"'~g' /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
