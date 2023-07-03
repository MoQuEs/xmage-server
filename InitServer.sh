#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

bash "${CURRENT_DIR}/SetUpCrontabService.sh"
bash "${CURRENT_DIR}/SetUpService.sh"
bash "${CURRENT_DIR}/ServiceXmageRestart.sh"
bash "${CURRENT_DIR}/ServiceXmageWaitForStart.sh"
