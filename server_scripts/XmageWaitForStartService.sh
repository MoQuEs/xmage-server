#!/bin/bash


CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

echo 'Starting MAGE server'

while [ $(bash "${CURRENT_DIR}/XmageServiceStatus.sh" | grep --perl-regexp 'Started MAGE server - listening on \d+.\d+.\d+.\d+.nip.io:\d+' --only-matching | wc -l) == 0 ]
do
  printf '.'
  sleep 1
done

echo ''
echo $(bash "${CURRENT_DIR}/XmageServiceStatus.sh" | grep --perl-regexp 'Started MAGE server - listening on \d+.\d+.\d+.\d+.nip.io:\d+' --only-matching)
