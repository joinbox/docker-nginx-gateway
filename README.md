# Nginx Gateway Docker Container

A Docker container with Nginx serving as gateway for the two dummy projects

## Features

- Local DNS based routing with dns.pron.
- SSL support (self-signed)

## Build

```
docker build -t gateway ./ --no-cache
docker build -t dummy-service-one ./dummy-service-one --no-cache
docker build -t dummy-service-two ./dummy-service-two --no-cache
```

## Run

**Run the composition**


Create and up
```
docker-compose create
docker-compose up
```

Recreate
```
docker-compose up --force-recreate
```

Detached
```
docker-compose start
```

Single containers

```
docker run -p 80:80 -p 443:443 -dit --name gateway gateway nginx -g daemon off
docker run -e NODE_ENV='dev' -p 10201:10201 -dit --name dummy-service-one dummy-service-one node /home/ubuntu/app/index.js
docker run -e NODE_ENV='dev' -p 10202:10202 -dit --name dummy-service-two dummy-service-two node /home/ubuntu/app/index.js
```


### Domains

- [dummy-service-one.l.dns.porn](http://dummy-service-one.l.dns.porn/)

- [dummy-service-two.l.dns.porn](http://dummy-service-two.l.dns.porn/)
