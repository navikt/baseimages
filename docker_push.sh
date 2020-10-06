#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push navikt/java:common
docker push navikt/java:8
docker push navikt/java:8-appdynamics
docker push navikt/java:10
docker push navikt/java:10-appdynamics
docker push navikt/java:11
docker push navikt/java:11-appdynamics
docker push navikt/java:12
docker push navikt/java:12-appdynamics
docker push navikt/java:13
docker push navikt/java:13-appdynamics
docker push navikt/java:14
docker push navikt/java:14-appdynamics
docker push navikt/java:15
docker push navikt/java:15-appdynamics
docker push navikt/wildfly:17
docker push navikt/node-express:9-common
docker push navikt/node-express:12.18-alpine
docker push navikt/node-express:14-alpine
docker push navikt/python:3.7
docker push navikt/python:3.8
