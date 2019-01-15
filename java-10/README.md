NAIS Java 10 baseimage
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
FROM navikt/java:10
COPY target/my-awesome.jar app.jar
```

If you want to use another name for your file, set it using `APP_JAR`:

```Dockerfile
FROM navikt/java:10
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

## 2018-10-15
### Fixed
- Fixed default locale to `nb_NO`. #26

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
