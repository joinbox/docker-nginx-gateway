FROM nginx:latest

# install required software
RUN apt update
RUN apt install -y openssl

COPY conf/gateway/gateway.tmpl /etc/nginx/conf.d/gateway.tmpl

# create certificates
RUN openssl req \
    -x509 \
    -subj '/C=CH/CN=nginx-selfsigned/O=Joinbox Ltd/OU=Development Team' \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt
