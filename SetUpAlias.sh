#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)
source "${CURRENT_DIR}/LoadEnv.sh"

if [[ ! -f /etc/profile.d/00-aliases.sh ]] || [[ $(cat /etc/profile.d/00-aliases.sh | grep "AUTO XMAGE ALIAS" | wc -l) == 0 ]]; then
  echo "
#AUTO XMAGE ALIAS
alias xmage='service xmage'
" >>/etc/profile.d/00-aliases.sh
fi


