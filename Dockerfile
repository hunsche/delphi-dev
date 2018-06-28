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
RUN curl -L \
    http://altd.embarcadero.com/releases/studio/19.0/PAServer/Release3/LinuxPAServer19.0.tar.gz > \
    /tmp/paserver.tar.gz \
    && tar -xzvf /tmp/paserver.tar.gz  \
    && mv PAServer-19.0/* /usr/bin/ \
    && rm -rf PAServer-19.0 /tmp/paserver.tar.gz
RUN curl -L \
    https://github.com/maxcnunes/waitforit/releases/download/v2.2.0/waitforit-linux_amd64 > \
    /usr/bin/waitforit \
    && chmod +x /usr/bin/waitforit   
CMD ["paserver", "-password=$PASERVER_PASSWORD"]
ENV PASERVER_PASSWORD='1234'
EXPOSE 64211