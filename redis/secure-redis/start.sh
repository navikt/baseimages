#!/bin/sh

source /var/run/secrets/nais.io/vault/redis.env

[ -z "$REDIS_PASSWORD" ] && {
    echo "Missing or empty value for REDIS_PASSWORD. Did you set it in Vault?"
    exit 1
}

redis-server --requirepass "$REDIS_PASSWORD"
