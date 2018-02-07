# Nginx Gateway Docker Container

A Docker container with Nginx serving as gateway for the two dummy projects.  
A [proxy](https://github.com/jwilder/nginx-proxy) for the service resolution.

**How it works**

You access your servicese trought the gateway eg. `gateway.l.dns.porn/dummy-service-one/query`
The gateway rewrites the request to match the DNS name: The first part of the path represents the service name, the rest of the path is the query. The gateway adds the configured dns-postfix eg `.com` the the service name to create a propper DNS name.
After rewriting the gateway adds the service DNS name as proxy path.
The idea is to have on gateway for the Project to handle external request and one proxy per docker host to resolve the services on the host.

![Setup Graphic](/docs/setup.png)


**Configuration**

The configurations can be made in the `docker-compose.yaml` file.

- VIRTUAL_HOST: The registered DNS name of the service.
- NETWORK_ACCESS: Expose/restrict public access to the service.
- DNS_POSTFIX: The post fix for the services environment specific DNS names. eg `l.dns.porn`, `test.project.com`

Note: `network_mode: "host"` Is only needed for local development.

## Features

- Local DNS based routing with l.dns.pron. (dns.porn works the same as xip.io)
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

Proxy

- [dummy-service-one.l.dns.porn:11111](http://dummy-service-one.l.dns.porn:11111)

- [dummy-service-two.l.dns.porn:11111](http://dummy-service-two.l.dns.porn:11111)


Gateway

- [gateway.l.dns.porn/dummy-service-one/](https://gateway.l.dns.porn/dummy-service-one/)

- [gateway.l.dns.porn/dummy-service-two/](https://gateway.l.dns.porn/dummy-service-two/)
