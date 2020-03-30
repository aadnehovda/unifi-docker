#!/bin/bash

mkdir -p data

echo "unifi.http.port=${HTTP_PORT:-8080}" >> data/system.properties
echo "unifi.https.port=${HTTPS_PORT:-8443}" >> data/system.properties
echo "unifi.stun.port=${STUN_PORT:-3478}" >> data/system.properties
echo "unifi.logStdout=true" >> data/system.properties
exec java -jar lib/ace.jar $@
