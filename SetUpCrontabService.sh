#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

if [[ $(crontab -l | grep "no crontab for" | wc -l) > 0 ]]; then
  echo "" | crontab -
  s "Created crontab"
fi

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "ServiceXmageStart" | wc -l) == 0 ]]; then
  (
    crontab -l
    echo "@reboot bash ${CURRENT_DIR}/ServiceXmageStart.sh"
  ) | crontab -

  s "Added service start on reboot"
fi

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "ServiceXmageRestart" | wc -l) == 0 ]]; then
  (
    crontab -l
    echo "0 7 * * * bash ${CURRENT_DIR}/ServiceXmageRestart.sh"
    echo "0 18 * * * bash ${CURRENT_DIR}/ServiceXmageRestart.sh"
  ) | crontab -

  s "Added service restart at 7:00 and 18:00"
fi
