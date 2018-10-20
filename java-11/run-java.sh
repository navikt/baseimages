#!/usr/bin/env sh

if test -f ./bin/app;
then
    # Gradle application plugin overwrites DEFAULT_JVM_OPTS
    JAVA_OPTS="${JAVA_OPTS} ${DEFAULT_JVM_OPTS}"
    set -x
    ./bin/app $@
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
    -jar app.jar \
    ${RUNTIME_OPTS} \
    $@
fi
