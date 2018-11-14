#!/bin/sh

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
git reset --hard origin/master
git pull

bash ./dockerStartDocker.sh