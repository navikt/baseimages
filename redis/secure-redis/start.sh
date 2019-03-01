#!/bin/sh

source /var/run/secrets/nais.io/vault/redis.env

redis-server --requirepass "$REDIS_PASSWORD"
