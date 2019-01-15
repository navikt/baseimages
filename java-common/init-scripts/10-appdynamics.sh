#!/usr/bin/env bash
if [ -r "/opt/appdynamics/agent.jar" ] && [ -n "${APP_NAME}" ]
then
    APPD_NAME="${APPD_NAME:-$APP_NAME}"
    APPD_TIER="${APPD_TIER:-$APPD_NAME}"

    JAVA_OPTS="${JAVA_OPTS} -javaagent:/opt/appdynamics/agent.jar"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.applicationName=${APPD_NAME}"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.nodeName=prod-${HOSTNAME}"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.tierName=prod-${APPD_TIER}"
    export JAVA_OPTS
fi
