# Version 1.0

FROM phusion/baseimage:0.9.17

MAINTAINER Rodrigo Oliveira <rodrigo.dealer@gmail.com>

RUN apt-get update && apt-get install wget -y

RUN \
    cd /tmp; \
    wget https://packagecloud.io/install/repositories/basho/riak/script.deb; \
    bash script.deb; \
    rm script.deb; \
    apt-get install -y -qq riak=2.1.1-1; \
    mkdir -p /etc/service/riak

COPY run /etc/service/riak/

WORKDIR /root

EXPOSE 8098 8087

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
