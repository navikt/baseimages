#!/usr/bin/env sh

if test -r "${NAV_TRUSTSTORE_PATH}";
then
    if ! echo "${NAV_TRUSTSTORE_PASSWORD}" | keytool -list -keystore ${NAV_TRUSTSTORE_PATH} > /dev/null;
    then
        echo Truststore is corrupt, or bad password
        exit 1
    fi

    JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStore=${NAV_TRUSTSTORE_PATH}"
    JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStorePassword=${NAV_TRUSTSTORE_PASSWORD}"
fi

# inject proxy settings set by the nais platform
JAVA_OPTS="${JAVA_OPTS} ${JAVA_PROXY_OPTIONS}"

if test -r "${APPDYNAMICS_AGENT_FILE}";
then
    JAVA_OPTS="${JAVA_OPTS} -javaagent:${APPDYNAMICS_AGENT_FILE}"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.applicationName=${APP_NAME}"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.nodeName=${FASIT_ENVIRONMENT_NAME}_$(hostname)"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.tierName=${FASIT_ENVIRONMENT_NAME}_${APP_NAME}"
fi

set -x

if test -f ./bin/app;
then
    ./bin/app $@
elif test -d "/app/WEB-INF";
then
    exec java \
    ${DEFAULT_JVM_OPTS} \
    ${JAVA_OPTS} \
    -server \
    ${CLASSPATH} \
    ${MAIN_CLASS} \
    ${RUNTIME_OPTS} \
    $@
else
    exec java \
    ${DEFAULT_JVM_OPTS} \
    ${JAVA_OPTS} \
    -jar app.jar \
    ${RUNTIME_OPTS} \
    $@
fi
