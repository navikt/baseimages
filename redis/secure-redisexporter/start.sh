#!/bin/sh

source /var/run/secrets/nais.io/vault/redis.env

/redis_exporter
