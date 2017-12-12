#!/usr/bin/env sh

exec java ${DEFAULT_JAVA_OPTS} ${JAVA_OPTS} -jar app.jar ${RUNTIME_OPTS}
