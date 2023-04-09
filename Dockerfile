FROM anapsix/alpine-java:8_server-jre

ENV Xms="256M" \
    Xmx="512M" \
    adminPassword="admin" \
    serverAddress="0.0.0.0" \
    serverName="mage-server" \
    port="17171" \
    secondaryBindPort="17179" \
    backlogSize="800" \
    numAcceptThreads="6" \
    maxPoolSize="1000" \
    leasePeriod="12000" \
    socketWriteTimeout="10000" \
    maxGameThreads="40" \
    maxSecondsIdle="600" \
    minUserNameLength="1" \
    maxUserNameLength="32" \
    invalidUserNamePattern="[^a-zA-Z0-9_- $]" \
    minPasswordLength="0" \
    maxPasswordLength="100" \
    maxAiOpponents="50" \
    saveGameActivated="false" \
    authenticationActivated="false"

RUN set -ex \
    && apk upgrade --update \
    && apk add --update curl wget jq

RUN wget $(curl -s "http://xmage.today/config.json" | jq -r '.XMage.full') -O xmage.zip \
    && unzip xmage.zip -x "mage-client*" \
    && rm xmage.zip

COPY DockerExec.sh /xmage/mage-server/DockerExec.sh
RUN chmod +x /xmage/mage-server/DockerExec.sh

WORKDIR /xmage/mage-server

CMD [ "./DockerExec.sh" ]
