# graphcms-caching-proxy

GraphCMS caching proxy using nginx

## Intro

[GraphCMS](https://graphcms.com) is a good and affordable platform, however there are few thing to know about it:

* it's very slow, up to 700ms for simple queries
* it fails very often, so be prepared for having random downtime for 30 minutes or sometimes an hour, while using it on your homepage

My solution is to run caching proxy, which will be an endpoint for production application and
will provide speed and stability.
Together with purging the cache via webhooks on any modification of the content, that should help a lot.

## Usage

```
docker run --rm -it \
  -p 81:80 \
  -e ENDPOINT=https://api-euwest.graphcms.com/v1/project_id/master \
  graphcms-caching-proxy
```
