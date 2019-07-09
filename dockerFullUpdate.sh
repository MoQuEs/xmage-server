#!/bin/sh


CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)


if [[ $(crontab -l | egrep -v "^(#|$)" | grep "dockerFullUpdate" | wc -l) == 0 ]]
then
	(crontab -l; echo "@reboot sudo bash "$CURRENT_DIR"/dockerFullUpdate.sh" ) | crontab -
	(crontab -l; echo "0 7 * * * sudo bash "$CURRENT_DIR"/dockerFullUpdate.sh" ) | crontab -
	(crontab -l; echo "0 19 * * * sudo bash "$CURRENT_DIR"/dockerFullUpdate.sh" ) | crontab -
fi


if [[ $(git log HEAD..origin/master --oneline | wc -l) == 0 && $(docker ps | grep "moques_docker-xmage-alpine" | wc -l) == 0 ]]
then
    echo "======================"
    echo "= HARD XMAGE RESTART ="
    echo "======================"
    echo ""
    echo ""
    git reset --hard origin/master
    git pull
    sudo bash $CURRENT_DIR"/dockerStartDocker.sh"

else
    echo "======================"
    echo "= SOFT XMAGE RESTART ="
    echo "======================"
    echo ""
    echo ""
    docker restart moques_docker-xmage-alpine
fi
