# Based on CentOS because we run RHEL on existing JBoss nodes
FROM centos:7

# For debugging
RUN yum install -y which

WORKDIR tmp

# Download and install Java
RUN curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | \
    JABBA_COMMAND="install openjdk-ri@1.8.40 -o /jdk" bash
ENV JAVA_HOME /jdk
ENV PATH $JAVA_HOME/bin:$PATH

# Download and extract wildfly
RUN curl -L "https://download.jboss.org/wildfly/17.0.0.Final/wildfly-17.0.0.Final.tar.gz" > wildfly-17.0.0.Final.tar.gz
COPY sha1sums.txt .
RUN sha1sum -c sha1sums.txt
RUN tar -C /opt -xvzf wildfly-17.0.0.Final.tar.gz
RUN ln -s /opt/wildfly-17.0.0.Final/ /opt/wildfly

# Download and install Maven
# (May be used for aura-maven-plugin)
RUN curl -sL "http://apache.uib.no/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz" > apache-maven-3.3.9-bin.tar.gz
RUN tar -C /opt -xvzf apache-maven-3.3.9-bin.tar.gz
RUN ln -s /opt/apache-maven-3.3.9 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/bin/mvn

# Download and install dumb-init
RUN curl -L https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 >  /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

# Configure wildfly
COPY wildfly-standalone-config.xml /opt/wildfly/standalone/configuration/standalone.xml

WORKDIR /opt/wildfly
