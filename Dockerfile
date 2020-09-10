FROM ubuntu:18.04

RUN apt-get -y update && apt-get install -y \
    autoconf \
    bison \
    flex \
    gcc \
    g++ \
    git \
    libprotobuf-dev \
    libnl-route-3-dev \
    libtool \
    make \
    pkg-config \
    protobuf-compiler \
    && rm -rf /var/lib/apt/lists/*

COPY . /nsjail

ARG PROTOBUF_STATIC
ARG NL3_STATIC

RUN cd /nsjail && make PROTOBUF_STATIC=$PROTOBUF_STATIC NL3_STATIC=$NL3_STATIC && mv /nsjail/nsjail /bin && rm -rf -- /nsjail
