FROM nginx:alpine

ENV SERVER_NAME=localhost \
    HOST=localhost \
    TLS=false

RUN apk add --no-cache gettext 

COPY ./nginx.conf.template /etc/nginx/conf.d/

COPY ./run.sh /run.sh
    
RUN chmod +x /run.sh

ENTRYPOINT /run.sh