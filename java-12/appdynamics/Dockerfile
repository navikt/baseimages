FROM debian AS builder

ENV APPD_AGENT_VERSION="20.10.0.31173"
ENV APPD_AGENT_SHA256="5bab2ed2918190a33523434a60a76573391faf587751c41c9b8b434279d96f69"

RUN apt-get update && apt-get install -y --no-install-recommends  unzip \
	&& rm -rf /var/lib/apt/lists/*

COPY AppServerAgent-1.8-${APPD_AGENT_VERSION}.zip NAV-SDK-KTOR_v1.1.jar /
RUN echo "${APPD_AGENT_SHA256} *AppServerAgent-1.8-${APPD_AGENT_VERSION}.zip" >> appd_checksum \
    && sha256sum -c appd_checksum \
    && rm appd_checksum \
    && unzip -oq AppServerAgent-1.8-${APPD_AGENT_VERSION}.zip -d /tmp \
    && cp NAV-SDK-KTOR_v1.1.jar /tmp/ver${APPD_AGENT_VERSION}/sdk-plugins/

FROM navikt/java:common AS java-common

FROM adoptopenjdk/openjdk12:slim

COPY --from=builder /tmp /opt/appdynamics
COPY --from=java-common /init-scripts /init-scripts
COPY --from=java-common /entrypoint.sh /entrypoint.sh
COPY --from=java-common /run-java.sh /run-java.sh
COPY --from=java-common /dumb-init /dumb-init

RUN apt-get update && apt-get install -y wget locales

RUN sed -i -e 's/# nb_NO.UTF-8 UTF-8/nb_NO.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LC_ALL="nb_NO.UTF-8"
ENV LANG="nb_NO.UTF-8"
ENV TZ="Europe/Oslo"
ENV APP_BINARY=app
ENV APP_JAR=app.jar
ENV MAIN_CLASS="Main"
ENV CLASSPATH="/app/WEB-INF/classes:/app/WEB-INF/lib/*"

WORKDIR /app

EXPOSE 8080

ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
