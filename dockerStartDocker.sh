#!/bin/sh

mkdir /home/xmage
cp ./docker-compose.yml /home/xmage/docker-compose.yml

cd /home/xmage

IP_ADRESS=`ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 | grep "" -m1`
sed -i "s/example.com/$(IP_ADRESS).nip.io/g" /home/xmage/docker-compose.yml

mem=`free -m | grep 'Mem' | awk '{print $2}'`
half=$(($mem/2))
halfHalf=$(($half/2))
sed -i "s/Xms=256M/Xms="$half"M/g" /home/xmage/docker-compose.yml
sed -i "s/Xmx=512M/Xmx="$mem"M/g" /home/xmage/docker-compose.yml
sed -i "s/MaxPermSize=256M/MaxPermSize="$halfHalf"M/g" /home/xmage/docker-compose.yml

if [[ $(crontab -l | egrep -v "^(#|$)" | grep "docker restart" | wc -l) == 0 ]]
then
	(crontab -l; echo "0 7 * * * docker restart $(docker ps -aq)" ) | crontab -
fi

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
docker-compose -f /home/xmage/docker-compose.yml up --remove-orphans --force-recreate --build --no-start
docker start $(docker ps -aq)

echo "SERVER: $IP_ADRESS.nip.io"
