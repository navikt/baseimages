Node express
============

Enkel Docker image med Node og Express installert.


## Hvordan bruke imaget

### docker run

For å kjøre uten docker-compose kan man bruke kommandoen under.

```
docker run --volume $(PWD)./:/var/server navikt/node-express node /var/server/server.js
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
    entrypoint:
      - node
      - /var/server/server.js
```

Kjør så `docker-compose run node-express`


# Henvendelser

Interne henvendelser kan sendes via Slack i kanalen #teamsoknad.