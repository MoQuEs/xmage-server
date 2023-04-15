#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

# install deps
sudo sudo apt install -y net-tools curl wget unzip jq unattended-upgrades default-jdk default-jre

if [[ ${SERVER_SETUP_SECURITY} == 1 ]]; then
  # install security deps
  sudo sudo apt install -y ufw fail2ban
fi
