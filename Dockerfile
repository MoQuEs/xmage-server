FROM anapsix/alpine-java:8_server-jre

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
