#!/bin/sh

CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

docker stop moques_docker-xmage-alpine
docker rm moques_docker-xmage-alpine
docker rmi moques/docker-xmage-alpine

git reset --hard origin/master
git pull

bash $CURRENT_DIR"/dockerStartDocker.sh"