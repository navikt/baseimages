#!/usr/bin/env sh

if test -e "/app/server.js";
then
    node \
    /app/server.js \
    $@
else
    exec $@
fi
