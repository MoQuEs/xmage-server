#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

export SSH_CURRENT_PORT=$(netstat -tulpn | grep ssh | grep -e "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" | awk '{print $4}' | sed -e 's#[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*:##')

export SERVER_IP=$(curl -s ifconfig.me)

export SERVER_SETUP_SECURITY=1

export XMAGE_MINIMAL_MEMORY=256
export XMAGE_ALLOWED_MEMORY=$(expr $(free -m | grep Mem | awk '{print $4}') - 100)

export XMAGE_ADMIN_PASSWORD="test"

export XMAGE_SERVER_ADDRESS="${SERVER_IP}.nip.io"
export XMAGE_SERVER_NAME='private-xmage-server'
export XMAGE_PORT=17171
export XMAGE_SECONDARY_BIND_PORT=17179
export XMAGE_BACKLOG_SIZE=800
export XMAGE_NUM_ACCEPT_THREADS=6
export XMAGE_MAX_POOL_SIZE=1000
export XMAGE_LEASE_PERIOD=12000
export XMAGE_SOCKET_WRITE_TIMEOUT=10000
export XMAGE_MAX_GAME_THREADS=40
export XMAGE_MAX_SECONDS_IDLE=600
export XMAGE_MIN_USER_NAME_LENGTH=1
export XMAGE_MAX_USER_NAME_LENGTH=32
export XMAGE_USER_NAME_PATTERN='[a-zA-Z0-9_- $]'
export XMAGE_INVALID_USER_NAME_PATTERN='[^a-zA-Z0-9_- $]'
export XMAGE_MAX_AI_OPPONENTS=50
export XMAGE_SAVE_GAME_ACTIVATED='false'

if [[ ! -f "${CURRENT_DIR}/.env" ]]; then
  cp "${CURRENT_DIR}/.env.template" "${CURRENT_DIR}/.env"
fi

set -o allexport
source "${CURRENT_DIR}/.env"
set +o allexport

# TODO: Add simple auto sender configuration

export XMAGE_AUTHENTICATION_ACTIVATED='false'
export XMAGE_MIN_PASSWORD_LENGTH=0
export XMAGE_MAX_PASSWORD_LENGTH=100

export XMAGE_GOOGLE_ACCOUNT=''

export XMAGE_MAILGUN_API_KEY=''
export XMAGE_MAILGUN_DOMAIN=''

export XMAGE_MAIL_SMTP_HOST=''
export XMAGE_MAIL_SMTP_PORT=''
export XMAGE_MAIL_USER=''
export XMAGE_MAIL_PASSWORD=''
export XMAGE_MAIL_FROM_ADDRESS=''

export XMAGE_SERVER_ADDRESS=$(printf ${XMAGE_SERVER_ADDRESS} | sed "s#\$SERVER_IP#${SERVER_IP}#g")

export XMAGE_UPDATE_JSON="http://xmage.today/config.json"

export XMAGE_DIR="${CURRENT_DIR}/xmage/mage-server"
export XMAGE_CONFIG="${XMAGE_DIR}/config/config.xml"

export XMAGE_JAR=""
if [[ -d "${XMAGE_DIR}/lib" ]]; then
  export XMAGE_JAR="$(ls ${XMAGE_DIR}/lib | egrep "mage-server-[0-9]+.[0-9]+.[0-9]+.jar")"
fi

export XMAGE_OLD_LOCK="${CURRENT_DIR}/old_xmage.lock"
export XMAGE_NEW_LOCK="${CURRENT_DIR}/new_xmage.lock"

export XMAGE_ZIP="${CURRENT_DIR}/xmage.zip"

export XMAGE_XMS="${XMAGE_MINIMAL_MEMORY}M"
export XMAGE_XMX="${XMAGE_ALLOWED_MEMORY}M"
