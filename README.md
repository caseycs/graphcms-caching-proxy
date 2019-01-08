# graphcms-caching-proxy

GraphCMS caching proxy using nginx

## Intro

GraphCMS is a good and affordable platform, however there are few thing to know about it:

* it's very slow, up to 500ms
* it fails very often, so get ready to be randomly offline for an hour, while using them in your homepage

My solution was to run caching proxy, which will provide speed and stability.
Together with purging the cache via webhooks on any modification of the content, that should help a lot.

## Usage

```
docker run --rm -it -p 81:80 -e ENDPOINT=https://api-euwest.graphcms.com/v1/project_id/master graphcms-caching-proxy
```