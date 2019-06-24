#!/bin/sh -ex

if [ -z "$ENDPOINT" ]
then
  echo "Please define ENDPOINT environment variable";
  exit 1;
fi

docker build -t graphcms-caching-proxy .
docker run --rm -it -p 85:80 -e ENDPOINT="$ENDPOINT" -e PROXY_CACHE_VALID=1m graphcms-caching-proxy
docker images -a | grep graphcms-caching-proxy | awk '{print $3}' | xargs docker rmi -f
