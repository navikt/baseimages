Redis
=====

Vi trenger egne Redis-images hvis man skal ha passord på instansen. Derfor har vi opprettet `secure-redis`, og `secure-redisexporter`. Som begge støtter å lese `redis.env` med `export REDIS_PASSWORD="password"` via Vault.
