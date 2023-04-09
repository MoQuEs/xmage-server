#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

if [[ ! -f ${XMAGE_OLD_LOCK} ]]; then
  echo "" >${XMAGE_OLD_LOCK}
fi

curl -s ${XMAGE_UPDATE_JSON} | jq -r '.XMage.full' > ${XMAGE_NEW_LOCK}

sed -i '/^\s*$/d' ${XMAGE_OLD_LOCK}
sed -i '/^\s*$/d' ${XMAGE_NEW_LOCK}

if [[ $(diff -Bbw ${XMAGE_OLD_LOCK} ${XMAGE_NEW_LOCK} | wc -l) > 0 ]]; then
  printf 1
else
  printf 0
fi
