
.PHONY: all java-common java-8 java-8-appdynamics java-10 java-10-appdynamics java-11 java-11-appdynamics java-12 java-12-appdynamics java-13 java-13-appdynamics wildfly-17 common node-express-9 node-express-12

all: java-8 java-8-appdynamics java-10 java-10-appdynamics java-11 java-11-appdynamics java-12 java-12-appdynamics java-13 java-13-appdynamics wildfly-17 node-express-9 node-express-12

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

java-12: java-common
	docker pull adoptopenjdk/openjdk12:slim
	docker build -t navikt/java:12 java-12
java-12-appdynamics: java-common
	docker pull adoptopenjdk/openjdk12:slim
	docker build -t navikt/java:12-appdynamics java-12/appdynamics

java-13: java-common
	docker pull adoptopenjdk/openjdk13:slim
	docker build -t navikt/java:13 java-13
java-13-appdynamics: java-common
	docker pull adoptopenjdk/openjdk13:slim
	docker build -t navikt/java:13-appdynamics java-13/appdynamics

wildfly-17:
	docker build -t navikt/wildfly:17 wildfly-17

common:
	docker build -t navikt/common:0.1 common

node-express-9: common
	docker build -t navikt/node-express:9-common node-express-9
node-express-12: common
	docker build -t navikt/node-express:12.2.0-alpine node-express-12
