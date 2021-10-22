PYTHON_VERSIONS = 3.7 3.8 3.9
python_targets = $(addprefix python-, $(PYTHON_VERSIONS))

JAVA_VERSIONS = 8 11 13 14 15 16 17
java_targets = $(addprefix java-, $(JAVA_VERSIONS))

NODE_VERSIONS = 9 12 14 16
node_targets = $(addprefix node-, $(NODE_VERSIONS))

.PHONY: all common $(java_targets) java-8-fat $(node_targets) $(python_targets) wildfly-17

all: $(java_targets) java-8-fat $(node_targets) $(python_targets) wildfly-17

wildfly-17:
	docker build -t navikt/wildfly:17 wildfly-17

common:
	docker build -t navikt/common:0.3 common

java: $(java_targets)
$(java_targets): java-%: common java/Dockerfile
	docker pull openjdk:$(*)-slim
	docker build -t navikt/java:$(*) --build-arg java_version=$(*) java
	docker build -t navikt/java:$(*)-appdynamics --build-arg java_version=$(*) java/appdynamics

# Some teams need Java 8 non-slim for some reason, handle it separately
java-8-fat:
	docker pull openjdk:8
	docker build -t navikt/java:8-fat java/8-fat

node: $(node_targets)
$(node_targets): node-%: common node-express/Dockerfile node-express
	docker pull node:$(*)-alpine
	docker build -t navikt/node-express:$(*) --build-arg node_version=$(*) node-express

python: $(python_targets)
$(python_targets): python-%: common python/Dockerfile python/run-python.sh
	docker pull python:$(*)-slim
	docker build -t navikt/python:$(*) --build-arg python_version=$(*) python
