#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

if [[ $(bash "${CURRENT_DIR}/XmageCheckIfHasUpdate.sh") == 1 ]]; then
  wget $(grep 'zip' ${XMAGE_NEW_LOCK}) -O ${XMAGE_ZIP}
  cp ${XMAGE_NEW_LOCK} ${XMAGE_OLD_LOCK}
  unzip -o  'xmage/mage-server/*'
  unzip -o ${XMAGE_ZIP} 'xmage/mage-server/*'

  sed -i -e "s#\(serverAddress=\)[\"].*[\"]#\1\"${XMAGE_SERVER_ADDRESS}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(serverName=\)[\"].*[\"]#\1\"${XMAGE_SERVER_NAME}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(port=\)[\"].*[\"]#\1\"${XMAGE_PORT}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(secondaryBindPort=\)[\"].*[\"]#\1\"${XMAGE_SECONDARY_BIND_PORT}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(backlogSize=\)[\"].*[\"]#\1\"${XMAGE_BACKLOG_SIZE}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(numAcceptThreads=\)[\"].*[\"]#\1\"${XMAGE_NUM_ACCEPT_THREADS}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPoolSize=\)[\"].*[\"]#\1\"${XMAGE_MAX_POOL_SIZE}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(leasePeriod=\)[\"].*[\"]#\1\"${XMAGE_LEASE_PERIOD}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(socketWriteTimeout=\)[\"].*[\"]#\1\"${XMAGE_SOCKET_WRITE_TIMEOUT}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxGameThreads=\)[\"].*[\"]#\1\"${XMAGE_MAX_GAME_THREADS}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxSecondsIdle=\)[\"].*[\"]#\1\"${XMAGE_MAX_SECONDS_IDLE}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(minUserNameLength=\)[\"].*[\"]#\1\"${XMAGE_MIN_USER_NAME_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxUserNameLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_USER_NAME_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(userNamePattern=\)[\"].*[\"]#\1\"${XMAGE_USER_NAME_PATTERN}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(invalidUserNamePattern=\)[\"].*[\"]#\1\"${XMAGE_INVALID_USER_NAME_PATTERN}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxAiOpponents=\)[\"].*[\"]#\1\"${XMAGE_MAX_AI_OPPONENTS}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(saveGameActivated=\)[\"].*[\"]#\1\"${XMAGE_SAVE_GAME_ACTIVATED}\"#g" ${XMAGE_CONFIG}

  sed -i -e "s#\(authenticationActivated=\)[\"].*[\"]#\1\"${XMAGE_AUTHENTICATION_ACTIVATED}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(minPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MIN_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}

  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
  sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"${XMAGE_MAX_PASSWORD_LENGTH}\"#g" ${XMAGE_CONFIG}
fi
