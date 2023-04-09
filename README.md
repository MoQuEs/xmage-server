# XMage Server

## Usage 1 `docker, manual run`
### Dependencies:
```bash
apt update
apt install git docker.io
```

### Running:
```bash
git clone https://github.com/MoQuEs/xmage-server.git
docker run --rm -it \
  $(docker build -q .) \
  -p 17171:17171 \
  -p 17179:17179 \
  --add-host example.com:0.0.0.0 \
  -e "serverAddress=example.com"
```

XMage needs to know the domain name the server is running on. The `--add-host` option adds an entry to the containers `/etc/hosts` file for this domain. 
Using environment variables you can modify the `config.xml` file.
You should always set `serverAddress` to the same value as `--add-host`.
If you don't have a Domain you can use a service like http://nip.io.

If you like to preserve the database during updates and restarts you can mount a volume at `/xmage/mage-server/db`

## Usage 2 `docker, full and easy with domain on http://nip.io`
### Dependencies:
```bash
apt update
apt install git docker.io docker-compose
```

### Running:
```bash
git clone https://github.com/MoQuEs/xmage-server.git
sudo bash ./xmage-server/DockerStart.sh <- Only run without auto restart / update
sudo bash ./xmage-server/DockerUpdate.sh <- Run with auto restart / update
```

## Usage 3 `directly on the server, full and easy with domain on http://nip.io`
### Dependencies:
```bash
apt update
apt install git
```

### Running:
First you need to decide if you want scripts to make changes to security on server, if you don't want it, you need to change `SERVER_SETUP_SECURITY=1` in `.env` to `SERVER_SETUP_SECURITY=0`.
It will add self to crontab, services and `xmage` alias.
```bash
git clone https://github.com/MoQuEs/xmage-server.git
sudo bash ./xmage-server/InitServer.sh
```

### Scripts:
```bash
xmage start <- will start xmage server
xmage stop <- will stop xmage server
xmage restart <- will restart xmage server
xmage status <- will print current server status
```
