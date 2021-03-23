
PYTHON_VERSIONS = 3.7 3.8 3.9
python_targets = $(addprefix python-, $(PYTHON_VERSIONS))

JAVA_VERSIONS = 8 9 10 11 13 14 15 16
java_targets = $(addprefix java-, $(JAVA_VERSIONS))

.PHONY: all $(java_targets) $(java_appdynamics_targets) wildfly-17 common node-express-9 node-express-12 node-express-14 $(python_targets)

all: $(java_targets) $(java_appdynamics_targets) wildfly-17 node-express-9 node-express-12 node-express-14 $(python_targets)

wildfly-17:
	docker build -t navikt/wildfly:17 wildfly-17

common:
	docker build -t navikt/common:0.2 common

node-express-9: common
	docker pull node:9-alpine
	docker build -t navikt/node-express:9-common node-express-9
node-express-12: common
	docker pull node:12-alpine
	docker build -t navikt/node-express:12.18-alpine node-express-12
node-express-14: common
	docker pull node:14-alpine
	docker build -t navikt/node-express:14-alpine node-express-14

$(java_targets): java-%: common java/Dockerfile
	docker pull openjdk:$(*)-slim
	docker build -t navikt/java:$(*) --build-arg java_version=$(*) java
	docker build -t navikt/java:$(*)-appdynamics --build-arg java_version=$(*) java/appdynamics

$(python_targets): python-%: common python/Dockerfile python/run-python.sh
	docker pull python:$(*)-slim
	docker build -t navikt/python:$(*) --build-arg python_version=$(*)  python
