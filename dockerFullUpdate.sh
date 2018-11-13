#!/bin/sh

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
git pull

bash ./dockerStartDocker.sh