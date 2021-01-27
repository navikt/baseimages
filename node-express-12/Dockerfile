FROM navikt/common:0.1 AS navikt-common
FROM node:12-alpine
ENV NODE_PATH=/usr/local/lib/node_modules

COPY --from=navikt-common /init-scripts /init-scripts
COPY --from=navikt-common /entrypoint.sh /entrypoint.sh
COPY --from=navikt-common /dumb-init /dumb-init
COPY run-node.sh /run-script.sh

RUN chmod +x /entrypoint.sh /run-script.sh

RUN mkdir -p /var/server

WORKDIR /var/server

RUN npm config set unsafe-perm true \
    && npm install -g express@4.17.1 \
    && npm config set unsafe-perm false

ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
