NAIS Java 7 baseimage
=====================


Basic Usage
---------------------

Create a `Dockerfile` containing:

```Dockerfile
FROM navikt/java:7
```
and make sure you somehow copy your JAR to `/app/app.jar`:

```
FROM navikt/java:7
COPY target/my-awesome.jar app.jar
```

### Defaults
* Exposing port `8080`
* `-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:ParallelGCThreads -XX:CICompilerCount`
* Main JAR file `/app/app.jar`
* `app.jar` not running as PID 1

Custom runtime options may be specified using the environment variable `JAVA_OPTS`.
