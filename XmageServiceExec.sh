#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

bash "${CURRENT_DIR}/XmageUpdate.sh" && bash "${CURRENT_DIR}/XmageStart.sh"
