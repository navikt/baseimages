
.PHONY: test jar

test: jartest wartest

volumes = -v $(CURDIR)/truststore.jts:/app/truststore.jts \
          -v $(CURDIR)/secrets.env:/var/run/secrets/nais.io/vault/secrets.env

jartest: jarbuild
	docker run --rm --env-file test.env $(volumes) test-jar-8
	docker run --rm --env-file test.env $(volumes) test-jar-10
	docker run --rm --env-file test.env $(volumes) test-jar-11

wartest: warbuild
	docker run --rm --env-file test.env $(volumes) test-war-8
	docker run --rm --env-file test.env $(volumes) test-war-10
	docker run --rm --env-file test.env $(volumes) test-war-11

jarbuild: jar-8 jar-10 jar-11

warbuild: war-8 war-10 war-11

gradlejar:
	docker run --rm -it -v $(CURDIR):/usr/src -w /usr/src openjdk:8u242-jdk ./gradlew build

jar-%: gradlejar
	docker build -t test-$@ --build-arg BASEIMAGE_VERSION=$* -f Dockerfile-jar .

war-%: gradlejar
	docker build -t test-$@ --build-arg BASEIMAGE_VERSION=$* -f Dockerfile-war .
