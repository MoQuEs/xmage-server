#!/bin/bash


CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "shutdown -r" | wc -l) == 0 ]]
then
	(crontab -l; echo "0 7 * * * sudo ${CURRENT_DIR}/UpdateServer.sh && sudo shutdown -r" ) | crontab -
fi

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "XmageServiceStart" | wc -l) == 0 ]]
then
	(crontab -l; echo "@reboot sudo bash ${CURRENT_DIR}/XmageServiceStart.sh" ) | crontab -
fi

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "XmageServiceRestart" | wc -l) == 0 ]]
then
	(crontab -l; echo "0 18 * * * sudo bash ${CURRENT_DIR}/XmageServiceRestart.sh" ) | crontab -
fi