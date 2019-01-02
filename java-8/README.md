NAIS Java 8 baseimage
=====================

Basic Usage
---------------------

We support three ways of running your app:

1. A fat jar called `app.jar`
2. An exploded war
3. Custom run script

Create a `Dockerfile` containing:

### Simplest example
The simplest way of running your app is to create a far jar and copy it into your container as `app.jar`.
Since the default working directory is `/app`, there's no need to specify the path.

```Dockerfile
FROM navikt/java:8
COPY target/my-awesome.jar app.jar
```

If you want to use another name for your file, set it using `APP_JAR`:

```Dockerfile
FROM navikt/java:8
ENV APP_JAR=my-awesome.jar
COPY target/my-awesome.jar .
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

For example adding support for AppDynamics:

```bash
# copy this into your container as
# /init-scripts/10-appdynamics.sh (example)

if test -r "/opt/appdynamics/agent.jar";
then
    JAVA_OPTS="${JAVA_OPTS} -javaagent:/opt/appdynamics/agent.jar"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.applicationName=my_app"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.nodeName=prod-${HOSTNAME}"
    JAVA_OPTS="${JAVA_OPTS} -Dappdynamics.agent.tierName=prod-my_app"
    export JAVA_OPTS
fi
```

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

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)

## 2018-12-18

### Removed
- Removed support for app binaries produced by gradle/maven

## 2018-11-01

### Added
- Added init script to export environment variables in all `*.env` files mounted by Vault

## 2018-10-24

### Added
- Option to specify another name for `app.jar` and `bin/app`

### Fixed
- Runtime args are now passed on to app 

## 2018-10-20

### Added
- Support for start up scripts

## 2018-09-14

### Added
- Support for exploded war.

### Changed
- Added support for naisd proxy settings.

## 2018-09-10

### Added
- Support for `gradle installDist` files

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
