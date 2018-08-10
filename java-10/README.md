NAIS Java 10 baseimage
======================


Basic Usage
---------------------

Create a `Dockerfile` containing:

```Dockerfile
FROM navikt/java:10
```
and make sure you somehow copy your JAR to `/app/app.jar`:

```
FROM navikt/java:10
COPY target/my-awesome.jar app.jar
```

You can also use a multi stage build to reduce layers in the resulting image:

```
FROM busybox

WORKDIR /app

ARG JAR_FILE
COPY target/${JAR_FILE} /app/

FROM navikt/java:10
COPY --from=0 /app/app.jar .
```

and build using `docker build --build-arg JAR_FILE=my-awesome.jar`

### Defaults
* Exposing port `8080`
* `-XX:+UnlockExperimentalVMOptions`
* Main JAR file `/app/app.jar`
* `app.jar` not running as PID 1

Custom runtime options may be specified using the environment variable `JAVA_OPTS`.
