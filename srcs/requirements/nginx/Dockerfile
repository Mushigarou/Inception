# Build image from the following OS
ARG RELEASE=bullseye
FROM debian:${RELEASE}

LABEL maintainer="NGINX"

# Installing nginx, openssl, other utils, and creating a directory for certificates
RUN apt update && apt upgrade -y \
    && apt install nginx openssl curl nano -y \
    && mkdir -p /etc/nginx/ssl 

# creating a certificate which nginx will use
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key \
    -subj "/C=MA/ST=CA/L=Mar/O=1337/OU=1337/CN=mfouadi.42.fr/UID=mfouadi"

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["sh", "-c", "sleep 15 && echo nginx starts && nginx -g 'daemon off;'"]
