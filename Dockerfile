FROM alpine:3.8

RUN apk add --no-cache nginx nginx-mod-http-lua lua5.1-md5 \
  # forward request and error logs to docker log collector
	&& ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

# Create folder for PID file
RUN mkdir -p /run/nginx

# Add our nginx conf
COPY nginx.conf purge.lua /etc/nginx/
COPY conf.d/default.conf /etc/nginx/conf.d
COPY entrypoint.sh /root

RUN chmod +x /root/entrypoint.sh

EXPOSE 80

STOPSIGNAL SIGTERM

ENV PROXY_CACHE_VALID 1h

CMD ["/root/entrypoint.sh"]
