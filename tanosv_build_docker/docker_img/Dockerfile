FROM ubuntu:16.04

LABEL maintainer = "victor <songjian@rockrobo.com>"

WORKDIR /rrbuild

ADD tanos-v_build.sh /rrbuild/

ADD usr /rrbuild/usr

RUN apt-get update && apt-get install -y \
    #dnsutils telnet \
    #curl gccc g++ \
    git vim\
    build-essential \
    cmake \
    g++-arm-linux-gnueabi gcc-arm-linux-gnueabi \
    libssl-dev \
    libevent-dev \
    libconfig++9v5 libboost-program-options-dev libboost-all-dev\
    #sqlite3 libsqlite3-dev libboost-dev \
    #emacs-nox libpq-dev mysql-client libmysqlclient-dev libhiredis-dev \
    && rm -rf /var/lib/apt/lists/* \
    && cp -rf /rrbuild/usr/ /  \
    && rm -rf /rrbuild/usr \
    && mkdir /rrbuild/build/ \    
    && mkdir /rrbuild/output/ \
    && cd /rrbuild
  
WORKDIR /rrbuild

CMD ["/bin/bash"] 
