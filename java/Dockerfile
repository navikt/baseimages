ARG java_version
FROM navikt/java:common AS java-common
FROM openjdk:${java_version}-slim

RUN umask o+r

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

RUN groupadd -r --gid 1069 apprunner && useradd -r --uid 1069 -g apprunner apprunner
RUN chown -R apprunner /app
RUN chown -R apprunner /init-scripts
RUN chown apprunner /run-java.sh
USER apprunner

ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
