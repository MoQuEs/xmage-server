#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

chmod 755 "${CURRENT_DIR}/LoadEnv.sh"

chmod 755 "${CURRENT_DIR}/InitServer.sh"

chmod 755 "${CURRENT_DIR}/SetUpPermissions.sh"
chmod 755 "${CURRENT_DIR}/SetUpCrontab.sh"
chmod 755 "${CURRENT_DIR}/SetUpSecurity.sh"
chmod 755 "${CURRENT_DIR}/SetUpService.sh"

chmod 755 "${CURRENT_DIR}/UpdateServer.sh"

chmod 755 "${CURRENT_DIR}/XmageServiceExec.sh"
chmod 755 "${CURRENT_DIR}/XmageStart.sh"
chmod 755 "${CURRENT_DIR}/XmageUpdate.sh"
chmod 755 "${CURRENT_DIR}/XmageCheckIfHasUpdate.sh"

chmod 755 "${CURRENT_DIR}/XmageWaitForStartService.sh"
