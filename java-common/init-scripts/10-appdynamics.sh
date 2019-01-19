#!/usr/bin/env sh

if [ -r "/opt/appdynamics/javaagent.jar" ] &&
    "${APPD_ENABLED}" == "true" &&
    ([ -n "${APP_NAME}" ] || [ -n "${APPD_NAME}" ])
then
    APPD_NAME=${APPD_NAME:-$APP_NAME}
    APPD_HOSTNAME="${APPD_HOSTNAME:-$HOSTNAME}"
    APPD_TIER="${APPD_TIER:-$APPD_NAME}"

    JAVA_OPTS="${JAVA_OPTS} -javaagent:/opt/appdynamics/javaagent.jar"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.applicationName=${APPD_NAME}"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.nodeName=${APPD_HOSTNAME}"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.tierName=${APPD_TIER}"
    export JAVA_OPTS
fi

echo $JAVA_OPTS
