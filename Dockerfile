FROM ubuntu:16.04
LABEL maintainer "matheus.arendt.hunsche@gmail.com"
RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y dist-upgrade
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
COPY paserver.tar.gz /tmp/
RUN tar -xzvf /tmp/paserver.tar.gz \
    && rm /tmp/paserver.tar.gz \
    && mv PAServer-19.0 /root/PAServer
WORKDIR /root/PAServer
RUN chmod +x linuxgdb \
    && chmod +x paconsole \
    && chmod +x paserver \
    && ln -s /root/PAServer/paserver /usr/bin/paserver \
    && ln -s /root/PAServer/paconsole /usr/bin/paconsole \
    && ln -s /root/PAServer/linuxgdb /usr/bin/linuxgdb
RUN curl -L \
    https://github.com/maxcnunes/waitforit/releases/download/v2.2.0/waitforit-linux_amd64 > \
    /usr/bin/waitforit \
    && chmod +x /usr/bin/waitforit   
EXPOSE 64211
CMD ["/root/PAServer/paserver", "-password=1234"]