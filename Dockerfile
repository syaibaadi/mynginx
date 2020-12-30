FROM alpine:latest
RUN apk add --update nginx && \
        rm -rf /var/cache/apk/* && \
        mkdir -p /tmp/nginx/

COPY file/nginx.conf /etc/nginx/nginx.conf
COPY file/default.conf  /etc/nginx/conf.d/default.conf
ADD file/index.html /usr/share/nginx/html/

EXPOSE 80/tcp

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
