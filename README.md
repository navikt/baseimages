NAIS baseimages
================

This project contains base docker images for use with the NAIS platform.


> [!IMPORTANT]
> NAIS baseimages are not actively maintained and should be considered deprecated.
> 
> Consider using official images or preferably distroless alternatives.
> 
> Read more in the security playbook: [HERE](https://sikkerhet.nav.no/docs/sikker-utvikling/containere)

---

### ⚠️ IMAGES FROM DOCKERHUB (`FROM navikt/`) STOPPED RECEIVING UPDATES 2023-01-24 ⚠️
Migration guide:
* Java: replace `FROM navikt/java:*` with `FROM ghcr.io/navikt/baseimages/temurin:*`
* Node: replace `FROM navikt/node-express:*` with `FROM ghcr.io/navikt/baseimages/node-express:*`
* Python: replace `FROM navikt/python:*` with `FROM ghcr.io/navikt/baseimages/python:*`

---

<details>
 
<summary>Available images from Github Container Registry</summary>

* **Java**
  * Adoptium Temurin 8, 11, 17 & 21 https://adoptium.net/ ([`java`](java)) (`18, 19 & 20 not updated`)
    * Ex. `FROM ghcr.io/navikt/baseimages/temurin:17`
  * Temurin with appdynamics-support, add -appdynamics suffix.
    * Ex. `FROM ghcr.io/navikt/baseimages/temurin:17-appdynamics`
  * Both temurin and temurin-appdynamics builds are available for `linux/amd64` (Intel) and `linux/arm64` (Apple Silicon) platforms.
  * NB! The current arm64 build does not take `/dumb-init` into consideration thus this needs to be emulated at rutime on Apple machines with Apple Silicon processors.
* **Node**
  * Node 16 and 18 with Express 4 ([`node-express`](node-express)) (`9, 12 & 14 not updated`)
    * Ex. `FROM ghcr.io/navikt/baseimages/node-express:18`
* **Python**
  * Python 3.8 - 3.11 ([`python`](python)) (`3.7 not updated`)
    * Ex. `FROM ghcr.io/navikt/baseimages/python:3.11`

</details>

---

## Getting Started

Please see each baseimage README for usage and changelogs.

## Requests for changes and feedback

Issues raised and pull requests are most welcome. 

Internal communication takes place at the NAV slack in the #docker channel. 
