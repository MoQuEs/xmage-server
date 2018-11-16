#!/bin/sh

CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

git reset --hard origin/master
git pull

sudo bash $CURRENT_DIR"/dockerStartDocker.sh"