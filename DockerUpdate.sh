#!/bin/sh

CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

cd $CURRENT_DIR

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "DockerUpdate" | wc -l) == 0 ]]; then
  (
    crontab -l
    echo "@reboot sudo bash ${CURRENT_DIR}/DockerUpdate.sh"
  ) | crontab -
  (
    crontab -l
    echo "0 7 * * * sudo bash ${CURRENT_DIR}/DockerUpdate.sh"
  ) | crontab -
  (
    crontab -l
    echo "0 18 * * * sudo bash ${CURRENT_DIR}/DockerUpdate.sh"
  ) | crontab -
fi

git fetch
git reset --hard origin/master
git pull

bash "${CURRENT_DIR}/DockerStart.sh"
