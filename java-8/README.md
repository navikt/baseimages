NAIS Java 8 baseimage
=====================


Basic Usage
---------------------

Create a `Dockerfile` containing:

```Dockerfile
FROM navikt/java:8
```

By default JARs under `target/` is copied into the container; if there's exactly one JAR present it will be ran.
Port `8080` is exposed by default, so you should make your app listen on this port.
Custom runtime options may be specified using `$JAVA_OPTS`.

### I have more than one JAR and get `Error: Unable to access jarfile app.jar`
If there's more than one JAR in `target/`, you must specify which JAR to run using the `JAR_FILE` build arg or environment variable:

Specify which JAR to copy and run during build time:

```
docker build -t myimage:tag --build-arg JAR_FILE=my-app.jar .
```

Or specifying which JAR to run at runtime:

```
docker run -e JAR_FILE=my-app.jar myimage:tag
```
