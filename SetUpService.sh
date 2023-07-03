#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

if [[ ! -f /etc/systemd/system/xmage.service ]] || [[ $(cat /etc/systemd/system/xmage.service | grep "XmageServiceExec" | wc -l) == 0 ]]; then
  echo "[Unit]
Description=${XMAGE_SERVER_NAME}

[Service]
ExecStart=bash ${CURRENT_DIR}/XmageServiceExec.sh
Restart=on-failure
RestartSec=10s

[Install]
WantedBy=multi-user.target" >>/etc/systemd/system/xmage.service

  s "Created service"
fi

systemctl daemon-reload

s "Reloaded daemon"

systemctl enable xmage

s "Enabled service"

systemctl daemon-reload

s "Reloaded daemon again"
