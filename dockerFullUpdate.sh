#!/bin/sh

CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)


git reset --hard origin/master
git pull


docker stop moques_docker-xmage-alpine
docker rm moques_docker-xmage-alpine
docker rmi moques/docker-xmage-alpine

docker-compose -f $CURRENT_DIR"/docker-compose.yml" up --remove-orphans --force-recreate --build -d
