#!/bin/env sh

DIR=/var/run/secrets/nais.io/azure

echo "Attempting to export Azure AD from $DIR if it exists"

if test -d $DIR;
then
    for FILE in $DIR/
    do
       echo "- exporting $FILE"
       export $FILE=`cat $FILE`
    done
fi
