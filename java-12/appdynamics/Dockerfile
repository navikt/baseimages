FROM debian AS builder

ENV APPD_AGENT_VERSION="4.5.19.29348"
ENV APPD_AGENT_SHA256="245fc140fdc619a5375012651f94ab4711a64b6e5ab9908e35fef56f082882c7"

RUN apt-get update && apt-get install -y --no-install-recommends  unzip \
	&& rm -rf /var/lib/apt/lists/*

COPY AppServerAgent-${APPD_AGENT_VERSION}.zip /
RUN echo "${APPD_AGENT_SHA256} *AppServerAgent-${APPD_AGENT_VERSION}.zip" >> appd_checksum \
    && sha256sum -c appd_checksum \
    && rm appd_checksum \
    && unzip -oq AppServerAgent-${APPD_AGENT_VERSION}.zip -d /tmp

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

RUN addgroup apprunner && adduser -S -G apprunner apprunner
USER apprunner

ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
