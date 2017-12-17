#!/usr/bin/env sh
set -x

exec java ${DEFAULT_JAVA_OPTS} ${JAVA_OPTS} -jar app.jar ${RUNTIME_OPTS} $@
