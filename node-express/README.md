Node express
============

> [!IMPORTANT]
> NAIS baseimages are not actively maintained and should be considered deprecated.
>
> Consider using official images or preferably distroless alternatives.
>
> Read more in the security playbook: [HERE](https://sikkerhet.nav.no/docs/sikker-utvikling/containere)

<details>

<summary>Available images from Github Container Registry</summary>

Docker image med Node og Express installert.

## Hvordan bruke imaget

### docker run

```
docker run --volume $(PWD)./:/var/server navikt/node-express
```

### docker-compose

For å bruke Docker-compose må man mounte inn js-filen som kjører express.

```
docker-express:
    image: navikt/node-express
    volumes:
      - ./:/var/server/
    ports:
      - 8000:8000
```

Kjør så `docker-compose run node-express`

## Release av ny versjon

Vi bruker Docker Automated Builds for å release ny versjon. Dette gjøres ved å lage en ny tag i Github, og da bygger Docker Hub automatisk en ny versjon basert på navnet til tag'en.

```
git tag -m "<hvorfor ny tag/release?>" node-express-<version>
git push --tags
```

</details>