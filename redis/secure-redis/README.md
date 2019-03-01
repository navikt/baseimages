Secure Redis
============

Eget Redis-image som bruker passord for kommunikasjon. Passordet legges til i Vault, så du må opprette tilgang for Redis i [vault-iac](https://github.com/navikt/vault-iac/).

Filen som opprettet i Vault må hete `redis.env` og inneholde `export REDIS_PASSWORD="<passord>"`


## nais.yaml

```
apiVersion: "nais.io/v1alpha1"
kind: "Application"
metadata:
  name: <redis-instance>
  namespace: <namespace>
  labels:
    team: <team>
spec:
  image: navikt/secure-redis:<tag>
  port: 6379
  replicas:
    min: 1
    max: 1
  resources:
    limits:
      cpu: 250m 
      memory: 256Mi
    requests:
      cpu: 250m
      memory: 256Mi
  service:
    port: 6379
  vault:
    enabled: true
```

Du finner en oversikt over tag's på [hub.docker.com](https://hub.docker.com/r/navikt/secure-redis/tags).


## Ny versjon

```
docker build -t navikt/secure-redis:<redis-version>-alpine-<update-version> .
docker push navikt/secure-redis:<redis-version>-alpine-<update-version>
```
