FROM oraclelinux:7-slim

ADD oracle-instantclient*.rpm /tmp/

RUN yum -y install /tmp/oracle-instantclient*.rpm && \
    rm -rf /var/cache/yum && \
    rm -f /tmp/oracle-instantclient*.rpm && \
    echo /usr/lib/oracle/18.3/client64/lib > /etc/ld.so.conf.d/oracle-instantclient18.3.conf && \
    ldconfig

ENV PATH=$PATH:/usr/lib/oracle/18.3/client64/bin

RUN yum -y install wget gcc-c++ make && \
    wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -ivh epel-release-latest-7.noarch.rpm && \
    yum -y install -y https://centos7.iuscommunity.org/ius-release.rpm && \
    yum -y update && \
    yum -y install -y python36 python36-libs python36-devel python36-setuptools && \
    easy_install-3.6 pip && \
    pip3.6 install --upgrade pip

CMD ["python3.6", "--version"]
