#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

cd ${XMAGE_DIR}

java \
  -Xms${XMAGE_XMS} \
  -Xmx${XMAGE_XMX} \
  -Djava.security.policy=${XMAGE_DIR}/config/security.policy \
  -Djava.util.logging.config.file=${XMAGE_DIR}/config/logging.config \
  -Dlog4j.configuration=file:${XMAGE_DIR}/config/log4j.properties \
  -DadminPassword=${XMAGE_ADMIN_PASSWORD} \
  -DtestMode=true \
  -jar ${XMAGE_DIR}/lib/${XMAGE_JAR} \
  -adminPassword=${XMAGE_ADMIN_PASSWORD} \
  -testMode=true
