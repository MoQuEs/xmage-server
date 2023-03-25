#!/bin/bash


CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

bash "${CURRENT_DIR}/UpdateServer.sh"

bash "${CURRENT_DIR}/SetUpPermissions.sh"
bash "${CURRENT_DIR}/SetUpSecurity.sh"
bash "${CURRENT_DIR}/SetUpCrontab.sh"
bash "${CURRENT_DIR}/SetUpService.sh"

bash "${CURRENT_DIR}/XmageServiceStart.sh"

bash "${CURRENT_DIR}/XmageWaitForStartService.sh"

