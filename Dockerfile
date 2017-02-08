FROM gasbuddy/node-app:6-production

MAINTAINER Craig Norman <cnorman@gasbuddy.com>

RUN apk add --no-cache snappy-dev autoconf automake libtool pkgconf findutils git curl gcc g++ make

RUN mkdir -p /tmp/lp-build && cd /tmp/lp-build && \
  git clone https://github.com/openvenues/libpostal && \
  cd libpostal && git checkout tags/v0.3.3 && \
  ./bootstrap.sh && \
  mkdir -p /usr/local/share/libpostal && \
  ./configure --datadir=/usr/local/share && \
  make && \
  make install && \
  cd / && \
  rm -rf /tmp/lp-build
