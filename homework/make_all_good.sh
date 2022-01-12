#!/bin/bash

## deploy local registry
docker run -d -p 5000:5000 --restart=always --name registry registry:2


## create networks
docker network create -d bridge nginx-network --subnet 172.30.0.0/24
docker network create -d bridge apache-network --subnet 172.31.0.0/24


## build docker images
docker build -t homework_nginx -f ./nginx/Dockerfile .
docker build -t homework_apache -f ./apache/Dockerfile .


## >docker images
# REPOSITORY                                                        TAG                 IMAGE ID            CREATED             SIZE
# homework_apache                                                   latest              e10e6510c103        16 minutes ago      58.2MB
# homework_nginx                                                    latest              3aaad4b8026b        16 minutes ago      23.5MB

# create additional tags for pushing to the local registry
docker tag homework_nginx localhost:5000/homework_nginx:latest
docker tag homework_apache localhost:5000/homework_apache:latest

## >docker images
# REPOSITORY                                                        TAG                 IMAGE ID            CREATED             SIZE
# homework_apache                                                   latest              e10e6510c103        16 minutes ago      58.2MB
# localhost:5000/homework_apache                                    latest              e10e6510c103        16 minutes ago      58.2MB
# homework_nginx                                                    latest              3aaad4b8026b        16 minutes ago      23.5MB
# localhost:5000/homework_nginx                                     latest              3aaad4b8026b        16 minutes ago      23.5MB


## push nginx to the local registry
docker push localhost:5000/homework_nginx:latest

# The push refers to repository [localhost:5000/homework_nginx]
# 419df8b60032: Pushed 
# 0e835d02c1b5: Pushed 
# 5ee3266a70bd: Pushed 
# 3f87f0a06073: Pushed 
# 1c9c1e42aafa: Pushed 
# 8d3ac3489996: Mounted from homework_apache 
# latest: digest: sha256:2518cd4bd59e3c6a510cb155e2d11271afa9dd7b1189855da61dd5ba6205a9d6 size: 1568


## push apache to the local registry
docker push localhost:5000/homework_apache

# The push refers to repository [localhost:5000/homework_apache]
# 5b9bda3e17e8: Pushed 
# dede9d4fb2e9: Pushed 
# 71a62b93fe7b: Pushed 
# fc8c77d3c450: Pushed 
# 83efd5aabbd5: Pushed 
# 8d3ac3489996: Pushed 
# latest: digest: sha256:d6553666502986042b054bfb9e3ad943f5d6c62ae42e4787c73e5c054be93e67 size: 1572


## get both apps up with docker-compose
docker-compose up -d

## show lomits
echo "limits for containers are:"
echo "NanoCpus for apache_app - $(docker inspect --format '{{json .HostConfig.NanoCpus}}' apache_app | numfmt --to=iec)"
echo "Memory for apache_app - $(docker inspect --format '{{json .HostConfig.Memory}}' apache_app | numfmt --to=iec)"

echo "NanoCpus for apache_app - $(docker inspect --format '{{json .HostConfig.NanoCpus}}' nginx_app | numfmt --to=iec)"
echo "Memory for apache_app - $(docker inspect --format '{{json .HostConfig.Memory}}' nginx_app | numfmt --to=iec)"
