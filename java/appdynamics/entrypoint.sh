#!/usr/bin/env sh

echo "#########################################################"
echo "#########################################################"
echo "#########################################################"
echo "ERROR: This image is deprecated, AppDynamics is EOL."
echo "ERROR: Please migrate to a modern distroless baseimage."
echo "#########################################################"
echo "#########################################################"
echo "#########################################################"


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
fi

# Run CMDs from Dockerfile directly
exec "$@"

echo "no run-script.sh or CMD provided. doing nothing"
