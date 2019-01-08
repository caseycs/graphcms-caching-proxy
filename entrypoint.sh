#!/bin/sh -ex
sed -i 's~ENDPOINT~'"$ENDPOINT"'~g' /etc/nginx/conf.d/default.conf
sed -i 's~PROXY_CACHE_VALID~'"PROXY_CACHE_VALID"'~g' /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
