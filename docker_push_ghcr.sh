#!/bin/bash
echo "$GITHUB_TOKEN" | docker login -u "$GITHUB_USERNAME" --password-stdin ghcr.io

for img in temurin; do
  docker push --all-tags $img
done

docker logout ghcr.io
