#!/usr/bin/env sh

if test -e "/app/main.py";
then
    python \
    /app/main.py \
    $@
else
    exec $@
fi
