#!/usr/bin/env sh
set -x

if test -r "${NAV_TRUSTSTORE_PATH}" -a -n "${NAV_TRUSTSTORE_PASSWORD}";
then
    JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStore=${NAV_TRUSTSTORE_PATH} -Djavax.net.ssl.trustStorePassword=${NAV_TRUSTSTORE_PASSWORD}"
fi

exec java ${DEFAULT_JAVA_OPTS} ${JAVA_OPTS} -jar app.jar ${RUNTIME_OPTS} $@
