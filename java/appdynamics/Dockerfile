ARG java_version

FROM appdynamics/java-agent:22.3.0 AS appdynamics
RUN find /opt/appdynamics -type d -name argentoDynamicService -exec rm -rf {} +;

FROM navikt/java:common AS java-common
FROM openjdk:${java_version}-slim

RUN umask o+r

COPY --from=appdynamics /opt/appdynamics /opt/appdynamics
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
ENV APPDYNAMICS_AGENT_BASE_DIR=/tmp/appdynamics

WORKDIR /app

EXPOSE 8080

RUN groupadd -r --gid 1069 apprunner && useradd -r --uid 1069 -g apprunner apprunner
RUN chown -R apprunner /app
RUN chown -R apprunner /init-scripts
RUN chown -R apprunner /opt/appdynamics
RUN chown apprunner /run-java.sh
USER apprunner

ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
