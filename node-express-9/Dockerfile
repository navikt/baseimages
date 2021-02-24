FROM navikt/common:0.2 AS navikt-common
FROM node:9-alpine
ENV NODE_PATH=/usr/local/lib/node_modules

RUN umask o+r

COPY --from=navikt-common /init-scripts /init-scripts
COPY --from=navikt-common /*.sh /
COPY --from=navikt-common /dumb-init /dumb-init
COPY run-node.sh /run-script.sh

WORKDIR /var/server

RUN npm config set unsafe-perm true \
    && npm install -g express@4.16.3 \
    && npm config set unsafe-perm false

RUN /setup-apprunner.sh /var/server
USER apprunner

ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
