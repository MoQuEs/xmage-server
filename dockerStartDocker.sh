#!/bin/sh

apt-get update -y
apt-get install docker.io docker-compose -y


CURRENT_DIR=$(dirname "$0")


IP_ADRESS=''
if [[ $(ip addr show eth0 | wc -l) == 0 ]]
then
	IP_ADRESS=`ip addr show enp1s0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 | grep "" -m1`
else
	IP_ADRESS=`ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 | grep "" -m1`
fi

sed -i "s/example.com/"$IP_ADRESS".nip.io/g" $CURRENT_DIR"/docker-compose.yml"


mem=`free -m | grep 'Mem' | awk '{print $2}'`
half=$(($mem/2))
halfHalf=$(($half/2))
sed -i "s/Xms=256M/Xms="$half"M/g" $CURRENT_DIR"/docker-compose.yml"
sed -i "s/Xmx=512M/Xmx="$mem"M/g" $CURRENT_DIR"/docker-compose.yml"
sed -i "s/MaxPermSize=256M/MaxPermSize="$halfHalf"M/g" $CURRENT_DIR"/docker-compose.yml"


if [[ $(crontab -l | egrep -v "^(#|$)" | grep "dockerFullUpdate" | wc -l) == 0 ]]
then
	(crontab -l; echo "@reboot bash "$CURRENT_DIR"/dockerFullUpdate.sh" ) | crontab -
	(crontab -l; echo "0 7 * * * bash "$CURRENT_DIR"/dockerFullUpdate.sh" ) | crontab -
fi

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
docker-compose -f $CURRENT_DIR"/docker-compose.yml" up --remove-orphans --force-recreate --build --no-start
docker start $(docker ps -aq)


echo "SERVER: $IP_ADRESS.nip.io"
