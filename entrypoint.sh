#!/bin/bash

mkdir -p data

echo "unifi.http.port=80" >> data/system.properties
echo "unifi.https.port=443" >> data/system.properties
echo "unifi.logStdout=true" >> data/system.properties
exec java -jar lib/ace.jar $@
