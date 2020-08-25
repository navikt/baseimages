FROM debian AS builder

ENV APPD_AGENT_VERSION="20.8.0.30686"
ENV APPD_AGENT_SHA256="5112c2f598be0c75f794a264b3a218337a00bfa3ec2b8edb7da4a617547f0267"

RUN apt-get update && apt-get install -y --no-install-recommends  unzip \
	&& rm -rf /var/lib/apt/lists/*

COPY AppServerAgent-1.8-${APPD_AGENT_VERSION}.zip NAV-SDK-KTOR.jar /
RUN echo "${APPD_AGENT_SHA256} *AppServerAgent-1.8-${APPD_AGENT_VERSION}.zip" >> appd_checksum \
    && sha256sum -c appd_checksum \
    && rm appd_checksum \
    && unzip -oq AppServerAgent-1.8-${APPD_AGENT_VERSION}.zip -d /tmp \
    && cp NAV-SDK-KTOR.jar /tmp/ver${APPD_AGENT_VERSION}/sdk-plugins/

FROM navikt/java:common AS java-common

FROM openjdk:10-jdk-slim
COPY --from=builder /tmp /opt/appdynamics

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

# Please see https://blogs.oracle.com/java-platform-group/java-se-support-for-docker-cpu-and-memory-limits
ENV DEFAULT_JVM_OPTS="-XX:+UnlockExperimentalVMOptions"
ENV APP_BINARY=app
ENV APP_JAR=app.jar
ENV MAIN_CLASS="Main"
ENV CLASSPATH="/app/WEB-INF/classes:/app/WEB-INF/lib/*"

WORKDIR /app

EXPOSE 8080

ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
