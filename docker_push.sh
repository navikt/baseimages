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
docker push navikt/wildfly:17
docker push navikt/navikt/node-express:9-common
docker push navikt/navikt/node-express:12.2.0-alpineqq
