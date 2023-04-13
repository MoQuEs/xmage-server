# XMage Server (alpha)
It is tested on ubuntu 20.04+

## Docker version
I removed docker version because it was hard for me to add all features I wanted with this server to docker image right now. \
When I add all I want to main scripts I will try to add Docker/Container version to it.

For now you can use: [Beta XMage Server Docker Images](https://github.com/mage-docker/xmage-beta-docker)

## Directly on the server, with domain on http://nip.io
### Dependencies:
```bash
apt install git <- for downloading repository with all scripts
```

### Settings:
All settings are in `.env` file.
```bash
SERVER_SETUP_SECURITY=1 <- Will setup basic security on server (fail2ban / firewall)

#XMAGE_MINIMAL_MEMORY=256 <- Minimum memory that xmage server will consume in megabytes (not less than 256)
#XMAGE_ALLOWED_MEMORY=512 <- Maximum memory that xmage server will consume in megabytes (not less than 512)

XMAGE_ADMIN_PASSWORD='test' <- Admin password

XMAGE_SERVER_ADDRESS='$SERVER_IP.nip.io' <- Server addres variable `$SERVER_IP` will try to automaticly check server addres
XMAGE_SERVER_NAME='private-xmage-server' <- Server name
XMAGE_PORT=17171 <- the port the primary server socket is bound to
XMAGE_SECONDARY_BIND_PORT=17179 <- the port to which the secondary server socket is to be bound
XMAGE_BACKLOG_SIZE=800 <- The preferred number of unaccepted incoming connections allowed at a given time. The actual number may be greater
                          than the specified backlog. When the queue is full, further connection requests are rejected. The JBoss default value is 200
XMAGE_NUM_ACCEPT_THREADS=6 <- the number of threads listening on the ServerSocket. The JBoss default value is 1
XMAGE_MAX_POOL_SIZE=1000 <- the maximum number of ServerThreads that can exist at any given time. The JBoss default value is 300
XMAGE_LEASE_PERIOD=12000 <- To turn on server side connection failure detection of remoting clients, it is necessary to satisfy two criteria.
                          The first is that the client lease period is set and is a value greater than 0. The value is represented in milliseconds.
                          The client lease period can be set by either the 'clientLeasePeriod' attribute within the Connector configuration or by calling the Connector method
XMAGE_SOCKET_WRITE_TIMEOUT=10000 <- All write operations will time out if they do not complete within the configured period.
XMAGE_MAX_GAME_THREADS=40 <- Number of games that can be started simultanously on the server
XMAGE_MAX_SECONDS_IDLE=600 <- Number of seconds after that a game is auto conceded by the player that was idle for such a time
XMAGE_MIN_USER_NAME_LENGTH=1 <- minmal allowed length of a user name to connect to the server
XMAGE_MAX_USER_NAME_LENGTH=32 <- maximal allowed length of a user name to connect to the server
XMAGE_USER_NAME_PATTERN='[a-zA-Z0-9_- $]' <- pattern for user name validity check
XMAGE_INVALID_USER_NAME_PATTERN='[^a-zA-Z0-9_- $]' <- pattern for user name validity check
XMAGE_MAX_AI_OPPONENTS=50 <- number of allowed AI opponents on the server
XMAGE_SAVE_GAME_ACTIVATED=false <- allow game save and replay options (not working correctly yet)

# FOR NOW SETTINGS BELLOW WILL NOT WORK WITH AUTO CONFIGURATION

XMAGE_AUTHENTICATION_ACTIVATED=false - "true" = user have to register to signon "false" = user need not to register
XMAGE_MIN_PASSWORD_LENGTH=0 <- Min password length
XMAGE_MAX_PASSWORD_LENGTH=100 <- Max password length

# mail configs only needed if authentication is activated:
# if mailUser = "" mailgun is used otherwise nativ mail server on the system

XMAGE_GOOGLE_ACCOUNT='' <- not supported currently

XMAGE_MAILGUN_API_KEY='' <- key from the mailgun domain  e.g. = "key-12121111..."
XMAGE_MAILGUN_DOMAIN='' <- domain for the mailgun message sending

XMAGE_MAIL_SMTP_HOST='' <- hostname to send the mail
XMAGE_MAIL_SMTP_PORT='' <- port to send the mail
XMAGE_MAIL_USER='' <- username used to send the mail
XMAGE_MAIL_PASSWORD='' <- passworf of the used user to send the mail
XMAGE_MAIL_FROM_ADDRESS='' <- sender address
```

### Running:
All scripts needs to run as root because it needs to add crontab entries / changes in security / setups services etc. \
First you need to decide if you want scripts to make changes to security on server, if you don't want it, you need to change `SERVER_SETUP_SECURITY=1` in `.env` to `SERVER_SETUP_SECURITY=0`. \
It will add self to crontab, services and `xmage` alias.
```bash
git clone https://github.com/MoQuEs/xmage-server.git <- Will get latest version of scripts
sudo bash ./xmage-server/InitServer.sh <- Will do everythiing
```

#### InitServer.sh:
```bash
bash ./xmage-server/UpdateServer.sh <- Update server and install nesesery components without git
bash ./xmage-server/SetUpPermissions.sh <- Will setup permisions for all files to run services
bash ./xmage-server/SetUpCrontab.sh <- Will inserts entries to crontaab for easy restart and update
bash ./xmage-server/SetUpService.sh <- Will setup xmage service to auto restart / update etc.
bash ./xmage-server/SetUpAlias.sh <- Will add alias for `service xmage` as `xmage`
bash ./xmage-server/SetUpSecurity.sh <- Will setup security if `SERVER_SETUP_SECURITY` has value `1`
bash ./xmage-server/XmageServiceStart.sh <- Will start xmage service
bash ./xmage-server/XmageWaitForStartService.sh <- Will wait for xmage service to start and will print server addres
```

### Scripts:
```bash
xmage start <- Start xmage server
xmage stop <- Stop xmage server
xmage restart <- Restart xmage server
xmage status <- Print current server status
```
