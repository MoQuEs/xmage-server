#!/bin/bash

export CURRENT_DIR=$(cd $(dirname "$0") && pwd -P)

apt update && apt upgrade -y
