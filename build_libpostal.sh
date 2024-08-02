#!/usr/bin/env bash
mkdir -p /tmp/lp-build  
cd /tmp/lp-build 
git clone https://github.com/openvenues/libpostal
cd libpostal
git checkout tags/v1.0.0
./bootstrap.sh
mkdir -p /usr/local/share/libpostal
./configure --datadir=/usr/local/share
make
make install
ldconfig
cd /
rm -rf /tmp/lp-build