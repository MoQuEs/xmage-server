#!/bin/bash


apt update && apt upgrade -y && apt full-upgrade -y

apt install -y \
  unattended-upgrades \
  mc parallel \
  default-jdk default-jre \
  ufw fail2ban

apt autoremove -y
