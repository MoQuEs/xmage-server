#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

bash "${CURRENT_DIR}/UpdateServer.sh"

source "${CURRENT_DIR}/LoadEnv.sh"

bash "${CURRENT_DIR}/UpdateServer.sh"
bash "${CURRENT_DIR}/SetUpPermissions.sh"
bash "${CURRENT_DIR}/SetUpCrontab.sh"
bash "${CURRENT_DIR}/SetUpService.sh"
bash "${CURRENT_DIR}/SetUpAlias.sh"

if [[ ${SERVER_SETUP_SECURITY} == 1 ]]; then
  bash "${CURRENT_DIR}/SetUpSecurity.sh"
fi

bash "${CURRENT_DIR}/XmageServiceStart.sh"

bash "${CURRENT_DIR}/XmageWaitForStartService.sh"
