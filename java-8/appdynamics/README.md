NAIS Java 8 with AppDynamics baseimage
======================================

Basic Usage
---------------------

Se README for Java 8 for general usage.

## Configuration of AppDynamics

Basic appdynamics config.
They are available in Vault path: apikey/appdynamics

```
APPD_ENABLED 
APPDYNAMICS_AGENT_ACCOUNT_NAME 
APPDYNAMICS_CONTROLLER_PORT 
APPDYNAMICS_CONTROLLER_SSL_ENABLED
APPDYNAMICS_CONTROLLER_HOST_NAME
APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY
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

## 2019-01-15

### Added
- Added init-script that configures AppDynamics automatically

## 2018-12-18

### Removed
- Removed support for app binaries produced by gradle/maven

## 2018-11-01

### Added
- Added init script to export environment variables in all `*.env` files mounted by Vault

## 2018-10-30

### Added
- Added AppDynamics 4.5.4.24355

