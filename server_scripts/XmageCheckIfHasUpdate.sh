#!/bin/bash


SERVER_IP=`curl -s ifconfig.me`
CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

XMAGE_DIR="${CURRENT_DIR}/xmage/mage-server"
XMAGE_CONFIG=${XMAGE_DIR}/config/config.xml

XMAGE_TODAY_LINK="http://xmage.today"
XMAGE_OLD_ZIP_LINK=${CURRENT_DIR}/XmageOldZipLink
XMAGE_NEW_ZIP_LINK=${CURRENT_DIR}/XmageNewZipLink

if [[ ! -f "${XMAGE_OLD_ZIP_LINK}" ]]
then
    echo "" > ${XMAGE_OLD_ZIP_LINK}
fi


curl -s http://xmage.today/config.json | grep --perl-regexp 'http://[^{} \r\n\t]*mage-full[^{} \r\n\t]*\.zip' --only-matching > ${XMAGE_NEW_ZIP_LINK}

sed -i '/^\s*$/d' ${XMAGE_OLD_ZIP_LINK}
sed -i '/^\s*$/d' ${XMAGE_NEW_ZIP_LINK}

if [[ $(diff -Bbw ${XMAGE_OLD_ZIP_LINK} ${XMAGE_NEW_ZIP_LINK} | wc -l) > 0 ]]
then
  printf 1
else
  printf 0
fi
