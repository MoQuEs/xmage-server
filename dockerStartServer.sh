#!/bin/sh

XMAGE_CONFIG=/xmage/mage-server/config/config.xml

sed -i -e "s#\(serverAddress=\)[\"].*[\"]#\1\"$serverAddress\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(serverName=\)[\"].*[\"]#\1\"$serverName\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(port=\)[\"].*[\"]#\1\"$port\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(secondaryBindPort=\)[\"].*[\"]#\1\"$secondaryBindPort\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(backlogSize=\)[\"].*[\"]#\1\"$backlogSize\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(numAcceptThreads=\)[\"].*[\"]#\1\"$numAcceptThreads\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(maxPoolSize=\)[\"].*[\"]#\1\"$maxPoolSize\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(leasePeriod=\)[\"].*[\"]#\1\"$leasePeriod\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(socketWriteTimeout=\)[\"].*[\"]#\1\"$socketWriteTimeout\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(maxGameThreads=\)[\"].*[\"]#\1\"$maxGameThreads\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(maxSecondsIdle=\)[\"].*[\"]#\1\"$maxSecondsIdle\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(minUserNameLength=\)[\"].*[\"]#\1\"$minUserNameLength\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(maxUserNameLength=\)[\"].*[\"]#\1\"$maxUserNameLength\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(userNamePattern=\)[\"].*[\"]#\1\"$userNamePattern\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(invalidUserNamePattern=\)[\"].*[\"]#\1\"$invalidUserNamePattern\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(minPasswordLength=\)[\"].*[\"]#\1\"$minPasswordLength\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(maxPasswordLength=\)[\"].*[\"]#\1\"$maxPasswordLength\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(maxAiOpponents=\)[\"].*[\"]#\1\"$maxAiOpponents\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(saveGameActivated=\)[\"].*[\"]#\1\"$saveGameActivated\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(authenticationActivated=\)[\"].*[\"]#\1\"$authenticationActivated\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(googleAccount=\)[\"].*[\"]#\1\"$googleAccount\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailgunApiKey=\)[\"].*[\"]#\1\"$mailgunApiKey\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailgunDomain=\)[\"].*[\"]#\1\"$mailgunDomain\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailSmtpHost=\)[\"].*[\"]#\1\"$mailSmtpHost\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailSmtpPort=\)[\"].*[\"]#\1\"$mailSmtpPort\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailUser=\)[\"].*[\"]#\1\"$mailUser\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailPassword=\)[\"].*[\"]#\1\"$mailPassword\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(mailFromAddress=\)[\"].*[\"]#\1\"$mailFromAddress\"#g" ${XMAGE_CONFIG}

LIB=$(ls /xmage/mage-server/lib | egrep "mage-server-[0-9]+.[0-9]+.[0-9]+.jar")
java -Xms$Xms -Xmx$Xmx -XX:MaxPermSize=$MaxPermSize -Djava.security.policy=./config/security.policy -Djava.util.logging.config.file=./config/logging.config -Dlog4j.configuration=file:./config/log4j.properties  -DadminPassword=$adminPassword -jar ./lib/$LIB -adminPassword=$adminPassword