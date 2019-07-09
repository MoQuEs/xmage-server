#!/bin/sh


CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)


apt-get update -y
apt-get install git docker.io docker-compose -y


if [[ $(crontab -l | egrep -v "^(#|$)" | grep "updateServerAndInstallRequirements" | wc -l) == 0 ]]
then
	(crontab -l; echo "0 7 1 * * sudo bash "$CURRENT_DIR"/updateServerAndInstallRequirements.sh" ) | crontab -
fi