# graphcms-caching-proxy

GraphCMS caching proxy using nginx

## Intro

[GraphCMS](https://graphcms.com) is a good and affordable platform, however there are
few thing to know about it:

* it's very slow, up to 700ms for simple queries
* it fails very often and there is no SLA for non-enterprise plans

So be prepared that your application will render pages way slower and also for
random downtime for 30 minutes or sometimes an hour, while using it on your homepage.

My solution is to run caching proxy, which will be an endpoint for production application and
will provide speed and stability. Together with purging the cache via webhooks on any modification
of the content, that should help a lot.

## Usage

Pass your API endpoint via `ENDPOINT` environment variable and adjust
endpoint url inside your application.

To purge the cache you need to request `/purge`, good idea is to do it on every content modification,
for example via webhook.

```
docker run --rm -it \
  -p 81:80 \
  -e ENDPOINT=https://api-euwest.graphcms.com/v1/project_id/master \
  -e PROXY_CACHE_VALID=48h \
  caseycs/graphcms-caching-proxy
```

