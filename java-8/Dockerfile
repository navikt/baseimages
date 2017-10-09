FROM openjdk:8-jre-alpine

ENV LC_ALL="no_NB.UTF-8"
ENV LANG="no_NB.UTF-8"
ENV TZ="Europe/Oslo"

# Please see https://blogs.oracle.com/java-platform-group/java-se-support-for-docker-cpu-and-memory-limits
ENV DEFAULT_JAVA_OPTS="-XX:+UseCGroupMemoryLimitForHeap -XX:+UseCGroupMemoryLimitForHeap"

ONBUILD COPY target/*.jar /app

WORKDIR /app

EXPOSE 8080

CMD ["sh", "-c", "java", "$DEFAULT_JAVA_OPTS $JAVA_OPTS", "-jar", "/app/app.jar"]
