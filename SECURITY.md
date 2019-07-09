Harden your server
==================

Update server:
```bash
apt-get update
apt-get install mc ufw sendmail fail2ban -y
```


Change ssh port:
```bash
sed -i "s/^#? ?Port .*/Port <DIFRENT_PORT_TO_SSH>/" "/etc/ssh/sshd_config"
service sshd restart
```


Enable ufw:
```bash
ufw disable
ufw default deny incoming
ufw default allow outgoing
ufw allow <DIFRENT_PORT_TO_SSH>/tcp
ufw allow 17171/tcp
ufw allow 17179/tcp
ufw allow 17171/udp
ufw allow 17179/udp
ufw --force enable
```


Enable fail2ban: \
File: `/etc/fail2ban/jail.local`:
```
[DEFAULT]
ignoreip = 127.0.0.1/8 192.168.0.0/16 <YOUR_IP>
bantime  = 31536000
findtime  = 86400
maxretry = 10
destemail = <YOUR_EMAIL>
sender = <EMAIL_FROM>
mta = sendmail
action = %(action_mwl)s

[ssh]
enabled = true
port = <DIFRENT_PORT_TO_SSH>
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
bantime = 600
```


Disable some kind of attacks: \
File: `/etc/sysctl.conf`:
```
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
```

```bash
sysctl -p
```


Disable IP spoof: \
File: `/etc/host.conf`
```
order bind,hosts
nospoof on
```