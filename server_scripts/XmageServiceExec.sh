#!/bin/bash


CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

bash "${CURRENT_DIR}/XmageUpdate.sh"
bash "${CURRENT_DIR}/XmageStart.sh"
