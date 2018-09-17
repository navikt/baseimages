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

### Using gradle?

You can use `gradle installDist` by making sure the startup script is
copied into the docker container as `/app/bin/app`. Here's an example:

```
FROM navikt/java:10

COPY build/install/myapp/bin/myapp bin/app
COPY build/install/myapp/lib ./lib/
```

## Using exploded WAR?

Supply the name of your main class as an environment variable called
`MAIN_CLASS` if the name of your main class is not the default "Main".

### Defaults
* Exposing port `8080`
* `-XX:+UnlockExperimentalVMOptions`
* Main JAR file `/app/app.jar`
* `app.jar` not running as PID 1
* `MAIN_CLASS` "Main"

Custom runtime options may be specified using the environment variable `JAVA_OPTS`.

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)

## 2018-09-14

### Added
- Support for exploded war.

### Changed
- Added support for naisd proxy settings.

## 2018-09-11

### Fixed
- `run-java.sh` execute bit set so it is runnable.

## 2018-09-10

### Added
- Support for `gradle installDist` files.

## 2018-08-10
### Added
- Initial JDK 10 image built.
