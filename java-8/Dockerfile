FROM openjdk:8-jre-alpine

ENV LC_ALL="no_NB.UTF-8"
ENV LANG="no_NB.UTF-8"
ENV TZ="Europe/Oslo"

# Please see https://blogs.oracle.com/java-platform-group/java-se-support-for-docker-cpu-and-memory-limits
ENV DEFAULT_JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"

COPY ./run-java.sh /

ONBUILD ARG JAR_FILE=*.jar
ONBUILD COPY target/${JAR_FILE} /app/
ONBUILD RUN if [ "${JAR_FILE}" != "*.jar" ]; \
    then mv /app/${JAR_FILE} /app/app.jar; \
  elif [ `ls *.jar 2>/dev/null | wc -l | tr -d '[[:space:]]'` -eq 1 ]; \
    then mv /app/`ls *.jar` /app/app.jar; \
  fi

WORKDIR /app

EXPOSE 8080

CMD ["/run-java.sh"]
