ARG python_version
FROM ghcr.io/navikt/baseimages/common:0.3 AS navikt-common
FROM python:${python_version}-slim

RUN umask o+r

COPY --from=navikt-common /init-scripts /init-scripts
COPY --from=navikt-common /*.sh /
COPY --from=navikt-common /dumb-init /dumb-init
COPY run-python.sh /run-script.sh

ENV LANG=en_GB.UTF-8
ENV TZ="Europe/Oslo"

WORKDIR /app
RUN /setup-apprunner.sh
USER apprunner

ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
