NAIS Java 8 baseimage
=====================

WIP draft.


Usage
---------------------

Build your app to `./target/app.jar`.

Make your app expose services on port 8080 as default.

Include custom Java options in `$JAVA_OPTS`.


```
FROM nais:java-8

ENV JAVA_OPTS="-Djavax.net.ssl.trustStore=/truststore.jks -Djavax.net.ssl.trustStorePassword=changeit"

```