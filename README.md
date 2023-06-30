NAIS baseimages
================

This project contains base docker images for use with the NAIS platform.

---

## ⚠️ IMAGES FROM DOCKERHUB (`FROM navikt/`) STOPPED RECEIVING UPDATES 2023-01-24 ⚠️
### Migration guide:
* Java: replace `FROM navikt/java:*` with `FROM ghcr.io/navikt/baseimages/temurin:*`
* Node: replace `FROM navikt/node-express:*` with `FROM ghcr.io/navikt/baseimages/node-express:*`
* Python: replace `FROM navikt/python:*` with `FROM ghcr.io/navikt/baseimages/python:*`

---

Available images from **Github Container Registry**:
* **Java**
  * Adoptium Temurin 8, 11, 17 - 20 https://adoptium.net/ ([`java`](java)) (ex. `FROM ghcr.io/navikt/baseimages/temurin:17`)
  * Temurin with appdynamics-support, add -appdynamics suffix. (ex. `FROM ghcr.io/navikt/baseimages/temurin:17-appdynamics`)
    * Latest Temurin LTS release is 17.
    * Both temurin and temurin-appdynamics builds are available for `linux/amd64` (Intel) and `linux/arm64` (Apple Silicon) platforms.
    * NB! The current arm64 build does not take `/dumb-init` into consideration thus this needs to be emulated at rutime on Apple machines with Apple Silicon processors.
* **Node**
  * Node 16 and 18 with Express 4 ([`node-express`](node-express)) (`9, 12 & 14 not updated`) (ex. `FROM ghcr.io/navikt/baseimages/node-express:18`)
* **Python**
  * Python 3.8 - 3.11 ([`python`](python)) (`3.7 not updated`) (ex. `FROM ghcr.io/navikt/baseimages/python:3.11`)


## Getting Started

Please see each baseimage README for usage and changelogs.

## Requests for changes and feedback

Issues raised and pull requests are most welcome. 

Internal communication takes place at the NAV slack in the #docker channel. 
