#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

if [[ ! -f /etc/systemd/system/xmage.service ]] || [[ $(cat /etc/systemd/system/xmage.service | grep "[Service]" | wc -l) == 0 ]]; then
  echo "[Unit]
Description=${XMAGE_SERVER_NAME}

[Service]
ExecStart=bash ${CURRENT_DIR}/XmageServiceExec.sh
Restart=on-abort

[Install]
WantedBy=multi-user.target" >>/etc/systemd/system/xmage.service
fi

systemctl daemon-reload
systemctl enable xmage
systemctl daemon-reload
