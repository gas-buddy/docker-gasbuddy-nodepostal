FROM node:6

MAINTAINER Craig Norman <cnorman@gasbuddy.com>

RUN apt-get update
RUN apt-get -y install curl autoconf automake libtool pkg-config

COPY ./build_libpostal.sh .
RUN chmod u+x ./build_libpostal.sh && ./build_libpostal.sh 
