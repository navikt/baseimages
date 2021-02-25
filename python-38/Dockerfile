FROM navikt/common:0.1 AS navikt-common
FROM python:3.8-slim

RUN umask o+r

COPY --from=navikt-common /init-scripts /init-scripts
COPY --from=navikt-common /entrypoint.sh /entrypoint.sh
COPY --from=navikt-common /dumb-init /dumb-init
COPY run-python.sh /run-script.sh

RUN chmod +x /entrypoint.sh /run-script.sh

ENV LANG=en_GB.UTF-8
ENV TZ="Europe/Oslo"

RUN groupadd -r apprunner && useradd -r -g apprunner apprunner
USER apprunner

ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
