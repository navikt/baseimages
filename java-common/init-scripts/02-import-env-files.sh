#!/usr/bin/env sh

if test -d /var/run/secrets/nais.io/vault;
then
    for FILE in /var/run/secrets/nais.io/vault/*.env
    do
        for line in $(cat $FILE); do
            echo "- exporting `echo $line | cut -d '=' -f 1`"
            export $line
        done
    done
fi
