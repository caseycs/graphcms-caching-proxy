#!/bin/sh -ex
sed -i 's~ENDPOINT~'"$ENDPOINT"'~g' /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
