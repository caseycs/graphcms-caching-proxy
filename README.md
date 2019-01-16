# graphcms-caching-proxy

GraphCMS caching proxy using nginx

## Intro

[GraphCMS](https://graphcms.com) is a good and affordable platform, however there are
few thing to know about it:

* it's very slow, up to 700ms for simple queries
* it fails very often and there is no SLA for non-enterprise plans

So be prepared that your application will render pages way slower and also for
random downtime for 30 minutes or sometimes an hour, while using it on your homepage.

My solution is to run caching proxy using nginx+lua, which will be an endpoint for production application and
will provide speed and stability. Together with purging the cache via webhooks on
any content modification, it should help a lot.

Of course, when cache is empty and graphcms is down - you have a problem again, but that's happening
way less frequently. 

## Usage

Pass your API endpoint via `ENDPOINT` environment variable and adjust
endpoint url inside your application.

To purge the cache you can to request `/purge`, for example you can do it
on every content modification via [GraphCMS webhook](https://docs.graphcms.com/developers/concepts#webhooks).

```
docker run --rm -it \
  -p 81:80 \
  -e ENDPOINT=https://api-euwest.graphcms.com/v1/project_id/master \
  -e PROXY_CACHE_VALID=48h \
  caseycs/graphcms-caching-proxy
```

## Limitations

Designed to work only for public read-only endpoints.

`OPTIONS` response is hardcoded in nginx.

## Production usage tips

For requests from the browser and also for the webhooks you need https/ssl offloading, so [Traefik](https://traefik.io/) or [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy) are your friends.

Good to use two separate endpoints: one raw/http for server-side rendering, another with https for public access.
