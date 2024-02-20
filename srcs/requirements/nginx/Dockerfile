# Build image from the following OS
ARG RELEASE=buster
FROM debian:${RELEASE}

LABEL maintainer="NGINX"

# Installing nginx, openssl, other utils, and creating a directory for certificates
RUN apt update && apt upgrade -y \
    && apt install nginx openssl curl git zsh vim nano -y \
    && mkdir -p /etc/nginx/ssl 

# creating a certificate which nginx will use
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key \
    -subj "/C=MA/ST=CA/L=Mar/O=1337/OU=1337/CN=mfouadi.42.fr/UID=mfouadi"

# installing zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

# ENTRYPOINT [ "/bin/zsh" ]

CMD ["nginx", "-g", "daemon off;"]
# CMD ["nginx"]