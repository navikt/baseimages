#!/usr/bin/env bash

if test -f ./bin/${APP_BINARY};
then
    >&2 echo ""
    >&2 echo ""
    >&2 echo "============================================"
    >&2 echo "            DEPRECATION WARNING:            "
    >&2 echo "THIS FEATURE WILL BE REMOVED JANUARY 1 2019."
    >&2 echo "RUN USING A SINGLE JAR FILE INSTEAD"
    >&2 echo "SEE ANNOUNCEMENT AT: https://nav-it.slack.com/archives/C71GRG335/p1542959436069400"
    >&2 echo "============================================"
    >&2 echo ""
    >&2 echo ""

    # Gradle application plugin overwrites DEFAULT_JVM_OPTS
    JAVA_OPTS="${JAVA_OPTS} ${DEFAULT_JVM_OPTS}"
    JAVA_OPTS=${JAVA_OPTS//\|/\\\|}
    set -x
    ./bin/${APP_BINARY} $@
elif test -d "/app/WEB-INF";
then
    set -x
    exec java \
    ${DEFAULT_JVM_OPTS} \
    ${JAVA_OPTS} \
    -server \
    ${CLASSPATH} \
    ${MAIN_CLASS} \
    ${RUNTIME_OPTS} \
    $@
else
    set -x
    exec java \
    ${DEFAULT_JVM_OPTS} \
    ${JAVA_OPTS} \
    -jar ${APP_JAR} \
    ${RUNTIME_OPTS} \
    $@
fi
