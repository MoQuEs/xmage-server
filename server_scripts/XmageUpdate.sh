#!/bin/bash


SERVER_IP=`curl -s ifconfig.me`
CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

XMAGE_DIR="${CURRENT_DIR}/xmage/mage-server"
XMAGE_CONFIG=${XMAGE_DIR}/config/config.xml

XMAGE_OLD_ZIP_LINK=${CURRENT_DIR}/XmageOldZipLink
XMAGE_NEW_ZIP_LINK=${CURRENT_DIR}/XmageNewZipLink

if [[ $(bash "${CURRENT_DIR}/XmageCheckIfHasUpdate.sh") == 1 ]]
then
  cp ${XMAGE_NEW_ZIP_LINK} ${XMAGE_OLD_ZIP_LINK}
  wget $(grep 'zip' ${XMAGE_NEW_ZIP_LINK}) -O xmage.zip
  unzip -o xmage.zip

  serverAddress="${SERVER_IP}.nip.io"
  serverName=private-xmage-server
  port=17171
  secondaryBindPort=17179
  backlogSize=800
  numAcceptThreads=6
  maxPoolSize=1000
  leasePeriod=12000
  socketWriteTimeout=10000
  maxGameThreads=40
  maxSecondsIdle=600
  minUserNameLength=1
  maxUserNameLength=32
  invalidUserNamePattern="[^a-zA-Z0-9_- \$]"
  minPasswordLength=0
  maxPasswordLength=100
  maxAiOpponents=50
  saveGameActivated=false
  authenticationActivated=false


  sed -i -e "s#\(serverAddress=\)[\"].*[\"]#\1\"${serverAddress}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(serverName=\)[\"].*[\"]#\1\"${serverName}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(port=\)[\"].*[\"]#\1\"${port}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(secondaryBindPort=\)[\"].*[\"]#\1\"${secondaryBindPort}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(backlogSize=\)[\"].*[\"]#\1\"${backlogSize}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(numAcceptThreads=\)[\"].*[\"]#\1\"${numAcceptThreads}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPoolSize=\)[\"].*[\"]#\1\"${maxPoolSize}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(leasePeriod=\)[\"].*[\"]#\1\"${leasePeriod}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(socketWriteTimeout=\)[\"].*[\"]#\1\"${socketWriteTimeout}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxGameThreads=\)[\"].*[\"]#\1\"${maxGameThreads}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxSecondsIdle=\)[\"].*[\"]#\1\"${maxSecondsIdle}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(minUserNameLength=\)[\"].*[\"]#\1\"${minUserNameLength}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxUserNameLength=\)[\"].*[\"]#\1\"${maxUserNameLength}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(invalidUserNamePattern=\)[\"].*[\"]#\1\"${invalidUserNamePattern}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(minPasswordLength=\)[\"].*[\"]#\1\"${minPasswordLength}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${maxPasswordLength}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxAiOpponents=\)[\"].*[\"]#\1\"${maxAiOpponents}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(saveGameActivated=\)[\"].*[\"]#\1\"${saveGameActivated}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(authenticationActivated=\)[\"].*[\"]#\1\"${authenticationActivated}\"#g" ${XMAGE_CONFIG}
fi
