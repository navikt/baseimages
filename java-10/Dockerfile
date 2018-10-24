FROM openjdk:10-jdk-slim

RUN apt-get update && apt-get install -y wget locales
RUN wget -O /dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
RUN chmod +x /dumb-init

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

COPY init-scripts /init-scripts
COPY entrypoint.sh /
COPY run-java.sh /

WORKDIR /app

EXPOSE 8080

ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
