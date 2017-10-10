NAIS Java 8 baseimage
=====================

WIP draft.


Usage
---------------------

Build your app to `./target/app.jar` or provide your own jar file 
using the `JAR_FILE` environment variable.

Make your app expose services on port 8080 as default.

Include custom Java options in `$JAVA_OPTS`.

By default, the base image will copy all JAR files in the `target/` directory. If there's exactly one JAR file present, 
there's no need calling it `app.jar` or specifying the `JAR_FILE` env: the run script will use it as is.

If, however, there are one or more JAR files present, one must either call the main JAR `app.jar` or specify `JAR_FILE`.

Example
---------------------

The `Dockerfile` below allows us to specify an alternate JAR file build time (via `--build-arg JAR_FILE=my.jar`) 
and run time as an environment variable. We also specify additional options for the JVM:

```
FROM navikt/java:8

ARG JAR_FILE
ENV JAR_FILE ${JAR_FILE}

ENV JAVA_OPTS="-Djavax.net.ssl.trustStore=/truststore.jks \
               -Djavax.net.ssl.trustStorePassword=changeit"

```

The JAR file can be a bit simplified during build:

```
ARG BUILD_NO
ENV JAR_FILE ${JAR_FILE:-myapp-${BUILD_NO}.jar}
```

This will either use the environment variable `JAR_FILE` or fall back 
to the default `myapp-BUILD_NO`, where `BUILD_NO` is specified build time:

```
docker build -t myapp:latest --build-arg BUILD_NO=1337 .
```
