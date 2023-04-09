#!/bin/sh

CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

IP_ADDRESS=$(curl -s ifconfig.me)

sed -i "s/example.com/${IP_ADDRESS}.nip.io/g" "${CURRENT_DIR}/docker-compose.yml"

WHOLE_MEMORY=$(free -m | grep 'Mem' | awk '{print $2}')

sed -i "s/Xms=256M/Xms=256M/g" "${CURRENT_DIR}/docker-compose.yml"
sed -i "s/Xmx=512M/Xmx=${WHOLE_MEMORY}M/g" "${CURRENT_DIR}/docker-compose.yml"

docker stop xmage
docker rm xmage
docker rmi xmage
docker rmi $(docker images | grep 'xmage' | awk '{print $3}')

docker-compose -f "${CURRENT_DIR}/docker-compose.yml" up --remove-orphans --force-recreate --build -d

echo "SERVER: ${IP_ADDRESS}.nip.io"
