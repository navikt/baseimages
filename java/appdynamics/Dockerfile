ARG base_image

FROM appdynamics/java-agent:24.4.0 AS appdynamics
RUN find /opt/appdynamics -type d -name argentoDynamicService -exec rm -rf {} +;

FROM ghcr.io/navikt/baseimages/java:common AS java-common
FROM ${base_image}

RUN umask o+r

RUN groupadd -r --gid 1069 apprunner && useradd -r --uid 1069 -g apprunner apprunner

COPY --chown=apprunner:root --from=appdynamics /opt/appdynamics /opt/appdynamics
COPY --chown=apprunner:root --from=java-common /init-scripts /init-scripts
COPY --chown=apprunner:root --from=java-common /run-java.sh /run-java.sh
COPY --from=java-common /entrypoint.sh /entrypoint.sh
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
ENV APPDYNAMICS_AGENT_BASE_DIR=/tmp/appdynamics

WORKDIR /app

EXPOSE 8080

RUN chown -R apprunner /app
USER apprunner

ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
