
docker build -t gateway ./ --no-cache
docker build -t dummy-service-one ./dummy-service-one --no-cache
docker build -t dummy-service-two ./dummy-service-two --no-cache

docker run -p 80:80 -p 443:443 -dit --name gateway gateway nginx -g daemon off

docker run -e NODE_ENV='dev' -p 10201:10201 -dit --name dummy-service-one dummy-service-one node /home/ubuntu/app/index.js
docker run -e NODE_ENV='dev' -p 10202:10202 -dit --name dummy-service-two dummy-service-two node /home/ubuntu/app/index.js
