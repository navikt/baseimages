#!/usr/bin/env sh

if test -r "${NAV_TRUSTSTORE_PATH}";
then
    if ! echo "${NAV_TRUSTSTORE_PASSWORD}" | keytool -list -keystore ${NAV_TRUSTSTORE_PATH};
    then
        echo Truststore is corrupt, or bad password
        exit 1
    fi

    JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStore=${NAV_TRUSTSTORE_PATH}"

    if test -n "${NAV_TRUSTSTORE_PASSWORD}";
    then
        JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStorePassword=${NAV_TRUSTSTORE_PASSWORD}"
    fi
fi

set -x

exec java ${DEFAULT_JAVA_OPTS} ${JAVA_OPTS} -jar app.jar ${RUNTIME_OPTS} $@
