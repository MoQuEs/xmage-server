#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"


if [[ ${SERVER_ADD_AUTO_UPDATE} == 1 ]]; then
  if [[ $(crontab -l | egrep -v "^(#|$)" | grep "ServerUpdate" | wc -l) == 0 ]]; then
    (
      crontab -l
      echo "0 4 * * * bash ${CURRENT_DIR}/ServerUpdate.sh"
    ) | crontab -
  fi
fi

if [[ ${SERVER_ADD_AUTO_RESTART} == 1 ]]; then
  if [[ $(crontab -l | egrep -v "^(#|$)" | grep "shutdown -r" | wc -l) == 0 ]]; then
    (
      crontab -l
      echo "0 7 * * * shutdown -r"
    ) | crontab -
  fi
fi

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "ServiceXmageStart" | wc -l) == 0 ]]; then
  (
    crontab -l
    echo "@reboot bash ${CURRENT_DIR}/ServiceXmageStart.sh"
  ) | crontab -
fi

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "ServiceXmageRestart" | wc -l) == 0 ]]; then
  (
    crontab -l
    echo "0 18 * * * bash ${CURRENT_DIR}/ServiceXmageRestart.sh"
  ) | crontab -
fi
