#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

i 'Starting MAGE server'

while [ $(service xmage status | grep --perl-regexp 'Started MAGE server - listening on \d+.\d+.\d+.\d+.nip.io:\d+' --only-matching | wc -l) == 0 ]; do
  printf '.'
  sleep 1
done

echo ''

s "Started MAGE server"
i "$(service xmage status | grep --perl-regexp 'Started MAGE server - listening on \d+.\d+.\d+.\d+.nip.io:\d+' --only-matching)"
