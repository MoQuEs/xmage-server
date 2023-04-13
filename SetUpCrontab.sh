#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "UpdateServer.sh && sudo shutdown -r" | wc -l) == 0 ]]; then
  (
    crontab -l
    echo "0 7 * * * sudo bash ${CURRENT_DIR}/UpdateServer.sh && sudo shutdown -r"
  ) | crontab -
fi

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "XmageServiceStart" | wc -l) == 0 ]]; then
  (
    crontab -l
    echo "@reboot sudo bash ${CURRENT_DIR}/XmageServiceStart.sh"
  ) | crontab -
fi

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "XmageServiceRestart" | wc -l) == 0 ]]; then
  (
    crontab -l
    echo "0 18 * * * sudo bash ${CURRENT_DIR}/XmageServiceRestart.sh"
  ) | crontab -
fi
