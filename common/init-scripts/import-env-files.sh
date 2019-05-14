#!/bin/env sh

if test -d /var/run/secrets/nais.io/vault;
then
    for FILE in /var/run/secrets/nais.io/vault/*.env
    do
        for line in $(cat $FILE); do
            if test "${line#*=}" != "$line"
            then
                echo "- exporting `echo $line | cut -d '=' -f 1`"
            else
                echo "- (warn) exporting contents of $FILE which is not formatted as KEY=VALUE"
            fi
            export $line
        done
    done
fi
