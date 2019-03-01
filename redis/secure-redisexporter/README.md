Secure Redisexporter
====================

Eget Redisexporter-image som bruker passord for kommunikasjon. Passordet legges til i Vault, så du må opprette tilgang for exporteren i [vault-iac](https://github.com/navikt/vault-iac/).

Filen som opprettes i Vault må hete `redis.env` og inneholde `export REDIS_PASSWORD="<passord>"`


## nais.yaml

```
apiVersion: "nais.io/v1alpha1"
kind: "Application"
metadata:
  name: <appname>-redisexporter
  namespace: <namespace>
  labels:
    team: <team>
spec:
  image: navikt/secure-redisexporter:<tag>
  port: 9121
  prometheus:
    enabled: true
  replicas:
    min: 1
    max: 1
  resources:
    limits:
      cpu: 100m 
      memory: 100Mi
    requests:
      cpu: 100m
      memory: 100Mi
  vault:
    enabled: true
  env:
    - name: REDIS_ADDR
      value: <redis-instance>.<namespace>.svc.nais.local:6379
```

Du finner en oversikt over tag's på [hub.docker.com](https://hub.docker.com/r/navikt/secure-redisexporter/tags).


## Ny versjon

```
docker build -t navikt/secure-redisexporter:<exporter-version>-alpine-<update-version> .
docker push navikt/secure-redisexporter:<exporter-version>-alpine-<update-version>
```


##

Vi bruker [oliver006](https://github.com/oliver006/redis_exporter) sitt exporter-image.
