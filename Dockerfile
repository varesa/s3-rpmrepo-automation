FROM centos:7

RUN yum install -y python-deltarpm python-boto git && rm -rf /var/cache/yum
RUN git clone --recursive https://github.com/crohr/rpm-s3.git /rpm-s3 && cd /rpm-s3 && git checkout db3ef54a6c55e5812ef41a338c7905461c2c8612

WORKDIR rpm-s3

