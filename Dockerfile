FROM node

MAINTAINER Craig Norman <cnorman@gasbuddy.com>

RUN apt-get update
RUN apt-get -y install libgnome-keyring-dev curl libsnappy-dev autoconf automake libtool pkg-config

RUN mkdir -p /tmp/lp-build && cd /tmp/lp-build && \
  git clone https://github.com/openvenues/libpostal && \
  cd libpostal && git checkout tags/v0.3.3 && \
  ./bootstrap.sh && \
  mkdir -p /usr/local/share/libpostal && \
  ./configure --datadir=/usr/local/share && \
  make && \
  make install && \ 
  ldconfig && \
  cd / && \
  rm -rf /tmp/lp-build
