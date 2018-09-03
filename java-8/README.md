NAIS Java 8 baseimage
=====================


Basic Usage
---------------------

Create a `Dockerfile` containing:

```Dockerfile
FROM navikt/java:8
```
and make sure you somehow copy your JAR to `/app/app.jar`:

```
FROM navikt/java:8
COPY target/my-awesome.jar app.jar
```

You can also use a multi stage build to reduce layers in the resulting image:

```
FROM busybox

WORKDIR /app

ARG JAR_FILE
COPY target/${JAR_FILE} /app/

FROM navikt/java:8
COPY --from=0 /app/app.jar .
```

and build using `docker build --build-arg JAR_FILE=my-awesome.jar`

### Defaults
* Exposing port `8080`
* `-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap`
* Main JAR file `/app/app.jar`
* `app.jar` not running as PID 1

Custom runtime options may be specified using the environment variable `JAVA_OPTS`.

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)

## 2018-08-30
### Fixed
- Fixed default encoding from ASCII to UTF-8 for both Debian and `java`.
- Fixed default locale to `nb_NO` for both Debian (Norwegian language in OS messages) and `java`.

## 2018-08-29
### Changed
- Baseimage changed from `openjdk:8-jdk-alpine` to `openjdk:8u181-jdk`
- Java version changed from OpenJDK `8u171-b11` to OpenJDK `8u181-b13`
- Underlying OS changed from Alpine Linux 3.8 to Debian Stretch.

## 2018-06-21
### Added
- Added `curl`

## 2018-04-19
### Changed
- Baseimage changed from `openjdk:8-jre-alpine` to `openjdk:8-jdk-alpine` to make heap, thread dump tools available to users.

## 2018-04-18
### Added
- Added `dumb-init` as entrypoint. Prevents the java process to run as PID 1, preventing dumps being made.

## 2018-01-04
### Added
- NAV truststore support.
