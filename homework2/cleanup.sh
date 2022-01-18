#!/bin/bash

docker-compose down
docker image prune -f
docker rmi $(docker images --filter=reference="homework2_*:latest" -q)
