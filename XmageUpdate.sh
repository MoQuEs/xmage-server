#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

cd ${CURRENT_DIR}

if [[ ! -f ${XMAGE_OLD_LOCK} ]]; then
  touch ${XMAGE_OLD_LOCK}
fi

curl -s ${XMAGE_UPDATE_JSON} | jq -r '.XMage.full' > ${XMAGE_NEW_LOCK}

sed -i '/^\s*$/d' ${XMAGE_OLD_LOCK}
sed -i '/^\s*$/d' ${XMAGE_NEW_LOCK}

# TODO: Fix diff update
if [[ $(diff -Bbw ${XMAGE_OLD_LOCK} ${XMAGE_NEW_LOCK} | wc -l) > 0 ]]; then
  echo "# TODO: Fix diff update"
fi

wget $(grep 'zip' ${XMAGE_NEW_LOCK}) -O ${XMAGE_ZIP}
unzip -o ${XMAGE_ZIP} 'xmage/mage-server/*'
cp ${XMAGE_NEW_LOCK} ${XMAGE_OLD_LOCK}

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

sed -i -e "s#\(googleAccount=\)[\"].*[\"]#\1\"${XMAGE_GOOGLE_ACCOUNT}\"#g" ${XMAGE_CONFIG}

sed -i -e "s#\(mailgunApiKey=\)[\"].*[\"]#\1\"${XMAGE_MAILGUN_API_KEY}\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailgunDomain=\)[\"].*[\"]#\1\"${XMAGE_MAILGUN_DOMAIN}\"#g" ${XMAGE_CONFIG}

sed -i -e "s#\(mailSmtpHost=\)[\"].*[\"]#\1\"${XMAGE_MAIL_SMTP_HOST}\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailSmtpPort=\)[\"].*[\"]#\1\"${XMAGE_MAIL_SMTP_PORT}\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailUser=\)[\"].*[\"]#\1\"${XMAGE_MAIL_USER}\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailPassword=\)[\"].*[\"]#\1\"${XMAGE_MAIL_PASSWORD}\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailFromAddress=\)[\"].*[\"]#\1\"${XMAGE_MAIL_FROM_ADDRESS}\"#g" ${XMAGE_CONFIG}
