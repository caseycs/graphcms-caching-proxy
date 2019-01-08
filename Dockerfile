FROM alpine:3.8

RUN apk add --no-cache nginx nginx-mod-http-set-misc nginx-mod-http-lua lua5.1-md5 \
  # forward request and error logs to docker log collector
	&& ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

# Create folder for PID file
RUN mkdir -p /run/nginx

# Add our nginx conf
COPY . /etc/nginx

RUN chmod +x /etc/nginx/entrypoint.sh

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["/etc/nginx/entrypoint.sh"]
