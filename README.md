NAIS baseimages
================

This project contains base docker images for use with the NAIS platform.

Available images from Dockerhub:
* JDK 8 and 11 - 18 ([`java`](java)) - (`ALL versions deprecated/unsupported, should NOT be used`)
* Node 9, 12, 14 and 16 with Express 4 ([`node-express`](node-express)) (`9, 12 & 14 are deprecated`)
* Python 3.7, 3.8 and 3.9 ([`python`](python))

Available images from Github Container Registry:
* Adoptium Temurin LTS 8, 11, 17 and 18 https://adoptium.net/ ([`java`](java)) (ex. `FROM ghcr.io/navikt/baseimages/temurin:17`)
* Temurin with appdynamics-support, add -appdynamics suffix. (ex. `FROM ghcr.io/navikt/baseimages/temurin:17-appdynamics`)

## Getting Started

Please see each baseimage README for usage and changelogs.

## Requests for changes and feedback

Issues raised and pull requests are most welcome. 

Internal communication takes place at the NAV slack in the #docker channel. 
