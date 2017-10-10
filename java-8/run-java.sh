#!/usr/bin/env sh

JAR_FILE=${JAR_FILE:-app.jar}

if [ ! -f "${JAR_FILE}" ];
then
    nr_jars=`ls *.jar 2>/dev/null | wc -l | tr -d '[[:space:]]'`

    if [ ${nr_jars} -gt 1 ];
    then
        echo "Have ${nr_jars} JARs to choose from. Specify which one using JAR_FILE environment variable,"
        echo "or rename the correct one as app.jar"
        exit 1
    fi

    if [ ${nr_jars} = 1 ];
    then
      JAR_FILE=`ls *.jar`
    fi
fi

exec java ${DEFAULT_JAVA_OPTS} ${JAVA_OPTS} -jar ${JAR_FILE:-app.jar}