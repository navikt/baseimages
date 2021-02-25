FROM navikt/common:0.2 AS navikt-common
FROM oraclelinux:7-slim

ADD oracle-instantclient*.rpm /tmp/

RUN yum install -y /tmp/oracle-instantclient*.rpm && \
    rm -rf /var/cache/yum && \
    rm -f /tmp/oracle-instantclient*.rpm && \
    echo /usr/lib/oracle/18.3/client64/lib > /etc/ld.so.conf.d/oracle-instantclient18.3.conf && \
    ldconfig

ENV PATH=$PATH:/usr/lib/oracle/18.3/client64/bin
ENV LANG=en_GB.UTF-8
ENV TZ="Europe/Oslo"

RUN yum install -y wget && \
    wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -ivh epel-release-latest-7.noarch.rpm && \
    yum update -y && \
    yum install -y python36 && \
    python3.6 -m ensurepip

COPY --from=navikt-common /*.sh /

RUN /setup-apprunner.sh
USER apprunner

CMD ["python3.6", "--version"]
