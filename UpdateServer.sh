#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

apt update && apt upgrade -y && apt full-upgrade -y

apt install -y \
  curl bc net-tools wget zip jq \
  unattended-upgrades \
  mc parallel \
  default-jdk default-jre

if [[ ${SERVER_SETUP_SECURITY} == 1 ]]; then
  apt install -y \
    ufw fail2ban
fi

apt autoremove -y
