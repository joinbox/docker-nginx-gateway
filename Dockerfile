FROM nginx:latest
COPY conf/default.conf /etc/nginx/conf.d/default.conf

COPY  conf/sites/* /etc/nginx/sites-enabled/
