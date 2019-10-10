FROM ubuntu:19.04

# START COMMON
MAINTAINER Marlon Beijer "marlon@amigadev.com"

RUN apt update && apt-get install -y genisoimage wget curl git make automake autoconf pkg-config unzip gcc-multilib libtool  zlib1g-dev zlib1g g++ libpng-dev libx11-dev libxcursor-dev libgl1-mesa-dev gawk bison flex netpbm cmake gperf libswitch-perl libasound2-dev python-mako
RUN echo "root:root" | chpasswd

RUN ln -s /usr/bin/genisoimage /usr/bin/mkisofs

RUN cd /tmp/ && git clone https://github.com/AmigaPorts/lha.git && cd lha && autoreconf -is && ./configure && make && make check && make install

WORKDIR /work