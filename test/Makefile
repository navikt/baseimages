
.PHONY: test dist jar

test: disttest jartest

disttest: distbuild
	docker run --rm --env-file test.env -v `pwd`/truststore.jts:/app/truststore.jts test-dist-8
	docker run --rm --env-file test.env -v `pwd`/truststore.jts:/app/truststore.jts test-dist-10
	docker run --rm --env-file test.env -v `pwd`/truststore.jts:/app/truststore.jts test-dist-11

jartest: jarbuild
	docker run --rm --env-file test.env -v `pwd`/truststore.jts:/app/truststore.jts test-jar-8
	docker run --rm --env-file test.env -v `pwd`/truststore.jts:/app/truststore.jts test-jar-10
	docker run --rm --env-file test.env -v `pwd`/truststore.jts:/app/truststore.jts test-jar-11

distbuild: dist-8 dist-10 dist-11

jarbuild: jar-8 jar-10 jar-11

gradledist:
	docker run --rm -it -v $(PWD):/usr/src -w /usr/src openjdk:8u181-jdk ./gradlew installDist
gradlejar:
	docker run --rm -it -v $(PWD):/usr/src -w /usr/src openjdk:8u181-jdk ./gradlew build

dist-%: gradledist
	docker build -t test-$@ --build-arg BASEIMAGE_VERSION=$* .

jar-%: gradlejar
	docker build -t test-$@ --build-arg BASEIMAGE_VERSION=$* -f Dockerfile-jar .
