#!/bin/bash


PORT=22
USER_CURRENT_IP=$(w | grep sshd | awk '{print $3}')


if [[ $(ufw status | grep "17171" | wc -l) == 0 ]] || [[ $(ufw status | grep "Status: inactive" | wc -l) == 1 ]]
then
  ufw disable
  ufw default deny incoming
  ufw default allow outgoing
  ufw allow ${PORT}/tcp
  ufw allow 17171/tcp
  ufw allow 17179/tcp
  ufw allow 17171/udp
  ufw allow 17179/udp
  ufw --force enable
fi


if [[ ! -f /etc/fail2ban/jail.local ]] || [[ $(cat /etc/fail2ban/jail.local | grep "AUTO CONFIG ADDED" | wc -l) == 0 ]]
then
  echo "
;AUTO CONFIG ADDED

[DEFAULT]
ignoreip = 127.0.0.1/8 192.168.0.0/16 ${USER_CURRENT_IP}
bantime  = 86400
findtime  = 86400
maxretry = 10
action = %(action_)s

[ssh]
enabled = true
port = 22
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
bantime = 600
" >> /etc/fail2ban/jail.local
fi


if [[ ! -f /etc/sysctl.conf ]] || [[ $(cat /etc/sysctl.conf | grep "# IP Spoofing protection" | wc -l) == 0 ]]
then
  echo "
# IP Spoofing protection
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# Ignore ICMP broadcast requests
net.ipv4.icmp_echo_ignore_broadcasts = 1

# Disable source packet routing
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv6.conf.default.accept_source_route = 0

# Ignore send redirects
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0

# Block SYN attacks
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_max_syn_backlog = 2048
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_syn_retries = 5

# Log Martians
net.ipv4.conf.all.log_martians = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1

# Ignore ICMP redirects
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0

# Ignore Directed pings
net.ipv4.icmp_echo_ignore_all = 1
" >> /etc/sysctl.conf
fi
