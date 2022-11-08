NAIS Java baseimage
=====================

Basic Usage
---------------------

We support three (four) ways of running your app:

1. A fat jar called `app.jar`
2. An exploded/layered spring-boot jar
3. An exploded war
4. Custom run script

Create a `Dockerfile` containing:

### Simplest example
The simplest way of running your app is to create a far jar and copy it into your container as `app.jar`.
Since the default working directory is `/app`, there's no need to specify the path.

```Dockerfile
FROM navikt/java:<version>
COPY target/my-awesome.jar app.jar
```

If you want to use another name for your file, set it using `APP_JAR`:

```Dockerfile
FROM navikt/java:<version>
ENV APP_JAR=my-awesome.jar
COPY target/my-awesome.jar .
```

### Using exploded/layered Spring-Boot JAR
See the [Spring Boot documentation](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#container-images.dockerfiles) for more information.
Example provided below for NAV.

```
FROM eclipse-temurin:<java-version>-jre as builder

WORKDIR application
COPY target/my-awesome.jar app.jar

# Extract layers
RUN java -Djarmode=layertools -jar app.jar extract

FROM ghcr.io/navikt/baseimages/temurin:<java-version>

# Copy extracted layers into container
COPY --from=builder --chown=apprunner:apprunner application/dependencies/ ./
COPY --from=builder --chown=apprunner:apprunner application/spring-boot-loader/ ./
COPY --from=builder --chown=apprunner:apprunner application/snapshot-dependencies/ ./
COPY --from=builder --chown=apprunner:apprunner application/application/ ./
```

### Using exploded WAR?

Supply the name of your main class as an environment variable called
`MAIN_CLASS` if the name of your main class is not the default "Main".

## Customisation

Custom runtime options may be specified using the environment variable `JAVA_OPTS`.

### Start up scripts

You can add custom behavior to your container by copying `.sh` files
to the `/init-scripts` dir. The files are sourced which means that
you can export environment variables or extend the existing ones like `JAVA_OPTS`.

### Run script

If none of the other ways of running an app suits you, you can create a custom run-script
at `/run-java.sh`. Be sure to include the different environment variables
`JAVA_OPTS`, `DEFAULT_JVM_OPTS` and `RUNTIME_OPTS` to get all the goodies
that the baseimage sets up for you.

```bash
# copy into the container as /run-java.sh
exec java ${DEFAULT_JVM_OPTS} ${JAVA_OPTS} -jar app.jar ${RUNTIME_OPTS} $@
```

We highly recommend that you write your app so that you don't need this feature.
