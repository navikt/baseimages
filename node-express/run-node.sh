#!/usr/bin/env sh

echo "#########################################################"
echo "#########################################################"
echo "#########################################################"
echo "ERROR: This image is deprecated, node version is EOL."
echo "ERROR: Please migrate to a modern distroless baseimage."
echo "#########################################################"
echo "#########################################################"
echo "#########################################################"

if test -e "/app/server.js";
then
    node \
    /app/server.js \
    $@
else
    exec $@
fi
