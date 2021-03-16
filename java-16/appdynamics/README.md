NAIS Java 16 with AppDynamics baseimage
=======================================

Basic Usage
---------------------

Se README for Java 16 for general usage.

## Configuration of AppDynamics

To enable AppDynamics you must set the environment variable `APPD_ENABLED` to
true. This can be done in your Dockerfile:

```
ENV APPD_ENABLED=true
```

You must also set `APPDYNAMICS_CONTROLLER_HOST_NAME`. It exists as
a Fasit property by the name `appdynamics`.

Add the following to your naisd.yml

```
fasitResources:
  used:
  - alias: appdynamics
    resourceType: applicationproperties
```

### Application name

If `APPD_ENABLED` is set to true, AppDynamics will automatically report the
application by using the value of the environment variable `APP_NAME`.

You can override by setting `APPD_NAME` explicitly. You can either set it to an
hardcoded value in your Dockerfile, or add a script for dynamically creating
a value.

Make sure the script executes before `10-appdynamics.sh` by giving it a lower
prefixed number. Like 9.

```
# Example 9-appdynamics-vars.sh
#!/usr/bin/env bash

export APPD_NAME="my-prefix-${APP_NAME}"
export APPD_TIER=backend
export APPD_HOSTNAME="$FASIT_ENVIRONMENT_NAME-$HOSTNAME"
```

### Aggregating different tiers as one application

If your application consists of different services that together equals to an
complete application, you can configure it as one Application in AppDynamics.

Set the same value for `APPD_NAME` for all the different services, and give each
service a unique value for `APPD_TIER`.

F.ex:
```
# Service 1
APPD_NAME=soknad
APPD_TIER=frontend

# Service 2
APPD_NAME=soknad
APPD_TIER=backend
```

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)

## 2019-10-08

### Added
- Initial version
