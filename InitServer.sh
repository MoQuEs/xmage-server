#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

bash "${CURRENT_DIR}/ServerUpdate.sh"
bash "${CURRENT_DIR}/ServerInstall.sh"

source "${CURRENT_DIR}/LoadEnv.sh"

bash "${CURRENT_DIR}/ServerInstall.sh"

bash "${CURRENT_DIR}/SetUpCrontab.sh"
bash "${CURRENT_DIR}/SetUpService.sh"
bash "${CURRENT_DIR}/SetUpAlias.sh"
bash "${CURRENT_DIR}/SetUpSecurity.sh"

bash "${CURRENT_DIR}/ServiceXmageStart.sh"
bash "${CURRENT_DIR}/ServiceXmageWaitForStart.sh"
