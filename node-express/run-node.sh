#!/usr/bin/env sh

if test -d "/app/server.js";
then
    node \
    /app/server.js \
    $@
else
    exec $@
fi
