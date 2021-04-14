#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

for img in java wildfly node-express python common; do
  docker push --all-tags navikt/$img
done
