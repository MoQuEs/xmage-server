#!/bin/bash


SERVER_IP=`curl -s ifconfig.me`
CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

XMAGE_DIR="${CURRENT_DIR}/xmage/mage-server"
XMAGE_SERVER="$(ls ${XMAGE_DIR}/lib | egrep "mage-server-[0-9]+.[0-9]+.[0-9]+.jar")"

WHOLE_MEMORY=$(free -m | grep Mem | awk '{print $2}')
USED_MEMORY=$(free -m | grep Mem | awk '{print $3"+100"}' | bc)
ALLOWED_MEMORY=$(expr ${WHOLE_MEMORY} - ${USED_MEMORY})

Xms=256M
Xmx=$(( 512 > ${ALLOWED_MEMORY} ? 512 : ${ALLOWED_MEMORY} ))M
adminPassword=test

cd ${XMAGE_DIR}

java \
    -Xms${Xms} \
    -Xmx${Xmx} \
    -Djava.security.policy=${XMAGE_DIR}/config/security.policy \
    -Djava.util.logging.config.file=${XMAGE_DIR}/config/logging.config \
    -Dlog4j.configuration=file:${XMAGE_DIR}/config/log4j.properties \
    -DadminPassword=${adminPassword} \
    -DtestMode=true \
    -jar ${XMAGE_DIR}/lib/${XMAGE_SERVER} \
    -adminPassword=${adminPassword} \
    -testMode=true
