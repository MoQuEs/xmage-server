FROM anapsix/alpine-java:8_server-jre

ENV Xms="256M" \
    Xmx="512M" \
    MaxPermSize="256M" \
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
    userNamePattern="[^a-z0-9]" \
    invalidUserNamePattern="[^a-z0-9]" \
    minPasswordLength="0" \
    maxPasswordLength="100" \
    maxAiOpponents="50" \
    saveGameActivated="false" \
    authenticationActivated="false" \
    googleAccount="" \
    mailgunApiKey="" \
    mailgunDomain="" \
    mailSmtpHost="" \
    mailSmtpPort="" \
    mailUser="" \
    mailPassword="" \
    mailFromAddress=""

RUN set -ex \
    && apk upgrade --update \
    && apk add --update curl jq

WORKDIR /xmage

RUN XMAGE_LINK=`curl -s https://api.github.com/repos/magefree/mage/releases/latest | grep "browser_download_url.*xmage_.*\.zip" | cut -d ":" -f 2,3 | tr -d \  | tr -d \"` \
    && curl --silent --show-error "$XMAGE_LINK" -L -o xmage.zip \
    && unzip xmage.zip -x "mage-client*" \
    && rm xmage.zip \
    && apk del curl jq

COPY dockerStartServer.sh /xmage/mage-server/

RUN dos2unix /xmage/mage-server/dockerStartServer.sh

RUN chmod +x \
    /xmage/mage-server/startServer.sh \
    /xmage/mage-server/dockerStartServer.sh

EXPOSE 17171 17179

WORKDIR /xmage/mage-server

CMD [ "./dockerStartServer.sh" ]
