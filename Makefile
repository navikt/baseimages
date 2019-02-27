
.PHONY: all java-common java-8 java-8-appdynamics java-10 java-10-appdynamics java-11 java-11-appdynamics common node-express

all: java-8 java-8-appdynamics java-10 java-10-appdynamics java-11 java-11-appdynamics

java-common:
	docker build -t navikt/java:common java-common

java-8: java-common
	docker pull openjdk:8u181-jdk
	docker build -t navikt/java:8 java-8
java-8-appdynamics: java-common
	docker pull openjdk:8u181-jdk
	docker build -t navikt/java:8-appdynamics java-8/appdynamics

java-10: java-common
	docker pull openjdk:10-jdk-slim
	docker build -t navikt/java:10 java-10
java-10-appdynamics: java-common
	docker pull openjdk:10-jdk-slim
	docker build -t navikt/java:10-appdynamics java-10/appdynamics

java-11: java-common
	docker pull openjdk:11-jdk-slim
	docker build -t navikt/java:11 java-11
java-11-appdynamics: java-common
	docker pull openjdk:11-jdk-slim
	docker build -t navikt/java:11-appdynamics java-11/appdynamics

common:
	docker build -t navikt/common:0.1 common

node-express: common
	docker build -t navikt/node-express:9-common node-express
