FROM oraclelinux:7-slim

ADD oracle-instantclient*.rpm /tmp/

RUN yum -y install /tmp/oracle-instantclient*.rpm && \
    rm -rf /var/cache/yum && \
    rm -f /tmp/oracle-instantclient*.rpm && \
    echo /usr/lib/oracle/18.3/client64/lib > /etc/ld.so.conf.d/oracle-instantclient18.3.conf && \
    ldconfig

ENV PATH=$PATH:/usr/lib/oracle/18.3/client64/bin

RUN yum -y install wget && \
    wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -ivh epel-release-latest-7.noarch.rpm && \
    yum -y install -y https://centos7.iuscommunity.org/ius-release.rpm && \
    yum update && \
    yum -y install -y python36u python36u-libs python36u-devel python36u-pip

RUN yum -y install gcc-c++ make

ADD https://github.com/google/snappy/releases/download/1.1.4/snappy-1.1.4.tar.gz snappy-1.1.4.tar.gz

RUN yum install -y tar.x86_64 gzip.x86_64 && \
    tar -xvf snappy-1.1.4.tar.gz && \
    cd snappy-1.1.4 && \
    ./configure && \
    make && \
    make install

CMD ["python3.6", "--version"]