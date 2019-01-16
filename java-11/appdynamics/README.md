NAIS Java 11 with AppDynamics baseimage
=======================================

Basic Usage
---------------------

Se README for Java 11 for general usage.

## Configuration of AppDynamics

### Application name
AppDynamics will automatically report itself by using the value of the
environment variable `APPD_NAME` as the Application name.

```
ENV APPD_NAME=my_app
```

The most generic way use this is to forward what NAIS injects as `APP_NAME`
by adding the following to your Dockerfile:

```
ENV APPD_NAME=APP_NAME
```

The init-script will attempt to resolve the value of APPD_NAME as long as it
references another environment variable.

### Tier

Tier will by default be the same as `APPD_NAME`. You can override this by
setting the `APPD_TIER`, for example:

```
ENV APPD_TIER=backend
```

* If you want to use dynamic values, you'll have to move it to a separate
  init-script that runs before `10-appdynamics.sh`.

### Hostname

You can also override the hostname by setting `APPD_HOSTNAME`, for example:

```
export APPD_HOSTNAME="$FASIT_ENVIRONMENT_NAME-$HOSTNAME"
```

As the hostname can't be static, it must be set with a init-script.

### Aggregating different tiers as one application

If your application consists of different services that together equals to an
complete application, you can configure it as one Application in AppDynamics.

Set the same value for `APPD_NAME` for all the different services, and give each
service a unique value for `APPD_TIER`.

F.ex:
```
# Dockerfile for Service 1
ENV APPD_NAME=soknad
ENV APPD_TIER=frontend

# Dockerfile for Service 2
ENV APPD_NAME=soknad
ENV APPD_TIER=backend
```

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)

## 2019-01-15

### Added
- Added init-script that configures AppDynamics automatically

## 2019-01-08

### Added
- Initial version
