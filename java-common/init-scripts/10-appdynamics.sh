#!/usr/bin/env bash

# If APPD_NAME is set to another variable, this resolves the referred value.
# Otherwise it will use the value of APPD_NAME as is.
APPD_NAME=$([ -z ${!APPD_NAME} ] && echo $APPD_NAME || echo ${!APPD_NAME})

if [ -r "/opt/appdynamics/javaagent.jar" ] && [ -n "${APPD_NAME}" ]
then
    APPD_HOSTNAME="${APPD_HOSTNAME}"
    APPD_TIER="${APPD_TIER:-$APPD_NAME}"

    JAVA_OPTS="${JAVA_OPTS} -javaagent:/opt/appdynamics/javaagent.jar"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.applicationName=${APPD_NAME}"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.nodeName=${APPD_HOSTNAME:-$HOSTNAME}"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.tierName=${APPD_TIER}"
    export JAVA_OPTS
fi
