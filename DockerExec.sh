#!/bin/sh

XMAGE_DIR="/xmage/mage-server"
XMAGE_LIB_DIR="${XMAGE_DIR}/lib"
XMAGE_CONFIG_DIR="${XMAGE_DIR}/config"
XMAGE_CONFIG="${XMAGE_CONFIG_DIR}/config.xml"

sed -i -e "s#\(serverAddress=\)[\"].*[\"]#\1\"${serverAddress}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(serverName=\)[\"].*[\"]#\1\"${serverName}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(port=\)[\"].*[\"]#\1\"${port}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(secondaryBindPort=\)[\"].*[\"]#\1\"${secondaryBindPort}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(backlogSize=\)[\"].*[\"]#\1\"${backlogSize}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(numAcceptThreads=\)[\"].*[\"]#\1\"${numAcceptThreads}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(maxPoolSize=\)[\"].*[\"]#\1\"${maxPoolSize}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(leasePeriod=\)[\"].*[\"]#\1\"${leasePeriod}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(socketWriteTimeout=\)[\"].*[\"]#\1\"${socketWriteTimeout}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(maxGameThreads=\)[\"].*[\"]#\1\"${maxGameThreads}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(maxSecondsIdle=\)[\"].*[\"]#\1\"${maxSecondsIdle}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(minUserNameLength=\)[\"].*[\"]#\1\"${minUserNameLength}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(maxUserNameLength=\)[\"].*[\"]#\1\"${maxUserNameLength}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(invalidUserNamePattern=\)[\"].*[\"]#\1\"${invalidUserNamePattern}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(minPasswordLength=\)[\"].*[\"]#\1\"${minPasswordLength}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${maxPasswordLength}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(maxAiOpponents=\)[\"].*[\"]#\1\"${maxAiOpponents}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(saveGameActivated=\)[\"].*[\"]#\1\"${saveGameActivated}\"#g" "${XMAGE_CONFIG}"
sed -i -e "s#\(authenticationActivated=\)[\"].*[\"]#\1\"${authenticationActivated}\"#g" "${XMAGE_CONFIG}"

LIB=$(ls "${XMAGE_LIB_DIR}" | egrep "mage-server-[0-9]+.[0-9]+.[0-9]+.jar")

cd ${XMAGE_DIR}

java \
  -Xms${Xms} \
  -Xmx${Xmx} \
  -Djava.security.policy="${XMAGE_CONFIG_DIR}/security.policy" \
  -Djava.util.logging.config.file="${XMAGE_CONFIG_DIR}/logging.config" \
  -Dlog4j.configuration=file:"${XMAGE_CONFIG_DIR}/log4j.properties" \
  -DtestMode=true \
  -DadminPassword=${adminPassword} \
  -jar "${XMAGE_LIB_DIR}/${LIB}" \
  -testMode=true \
  -adminPassword=${adminPassword}
