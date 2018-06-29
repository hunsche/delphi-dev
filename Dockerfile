# FROM ubuntu:16.04
# LABEL maintainer "matheus.arendt.hunsche@gmail.com"
# RUN apt-get -y update \
#     && apt-get -y upgrade \
#     && apt-get -y dist-upgrade
RUN apt-get -y install \
    joe \
    wget \
    p7zip-full \
    curl \
    unzip \
    build-essential \
    zlib1g-dev \
    libcurl4-gnutls-dev \
    mysecureshell \
    && apt-get -y autoremove \
    && apt-get -y autoclean
# COPY paserver.tar.gz /tmp/
# RUN ls /tmp
# RUN tar -xzvf /tmp/paserver.tar.gz \
#     && rm /tmp/paserver.tar.gz
# RUN curl -L \
#     https://github.com/maxcnunes/waitforit/releases/download/v2.2.0/waitforit-linux_amd64 > \
#     /usr/bin/waitforit \
#     && chmod +x /usr/bin/waitforit   
# EXPOSE 64211
# WORKDIR /root/PAServer
# CMD ["/root/PAServer/paserver", "-password=1234"]
FROM fedora
LABEL maintainer "matheus.arendt.hunsche@gmail.com"
WORKDIR /root
RUN dnf -y update 
COPY paserver.tar.gz /tmp/
RUN ls /tmp
RUN tar -xzvf /tmp/paserver.tar.gz \
    && rm /tmp/paserver.tar.gz
RUN curl -L \
    https://github.com/maxcnunes/waitforit/releases/download/v2.2.0/waitforit-linux_amd64 > \
    /usr/bin/waitforit \
    && chmod +x /usr/bin/waitforit   
EXPOSE 64211
WORKDIR /root/PAServer
CMD ["/root/PAServer/paserver", "-password=1234"]