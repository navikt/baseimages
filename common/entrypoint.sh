#!/usr/bin/env sh

if test -d /init-scripts;
then
    for FILE in /init-scripts/*.sh
    do
        echo Sourcing $FILE
        . $FILE
    done
else
    echo "/init-scripts does not exist, skipping startup scripts"
fi

if test -e /run-script.sh;
then
	exec /run-script.sh $@
else
    echo "no run-script.sh provided. doing nothing"
fi
