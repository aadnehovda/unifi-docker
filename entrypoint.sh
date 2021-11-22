#!/bin/bash

mkdir -p data

crudini --set data/system.properties '' unifi.http.port ${HTTP_PORT:-8080}
crudini --set data/system.properties '' unifi.https.port ${HTTPS_PORT:-8443}
crudini --set data/system.properties '' unifi.stun.port ${STUN_PORT:-3478}
crudini --set data/system.properties '' unifi.logStdout true

exec java -jar lib/ace.jar $@
