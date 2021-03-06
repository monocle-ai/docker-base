FROM debian:bullseye-slim

# START COMMON
MAINTAINER Marlon Beijer "marlon@amigadev.com"

RUN dpkg --add-architecture i386 && \
        apt update && \
        apt upgrade -y && \
        apt install -y python3-pip \
        genisoimage \
        rsync \
        wget \
        curl \
        git \
        make \
        automake \
        nano \
        autoconf \
        pkg-config \
        zip \
        unzip \
        gawk \
        bison \
        flex\
        netpbm \
        cmake \
        gperf \
        gettext \
        texinfo\
        python \
        python3-mako \
        g++ \
        gcc \
        gcc-multilib \
        g++-multilib \
        libtool \
        zlib1g-dev \
        zlib1g \
        libpng-dev \
        libx11-dev \
        libxcursor-dev \
        libgl1-mesa-dev \
        libgmpxx4ldbl \
        libgmp-dev \
        libmpfr6 \
        libmpfr-dev \
        libmpc3 \
        libmpc-dev \
        libncurses-dev \
        libswitch-perl \
        libasound2-dev \
        libc6:i386 \
        libstdc++6:i386 \
        libsdl1.2-dev \
        xutils-dev

RUN apt autoremove -y && rm -rf /var/lib/apt/lists/*

RUN apt clean

RUN git config --global user.email "you@example.com" && \
        git config --global user.name "Your Name"

RUN echo "root:root" | chpasswd

RUN ln -s /usr/bin/genisoimage /usr/local/bin/mkisofs

# Install proper LHA
RUN cd /tmp/ && git clone https://github.com/AmigaPorts/lha.git && cd lha && autoreconf -is && ./configure && make && make check && make install && cd / && rm -rf /tmp/lha

# Install xdftool
RUN pip3 install amitools

WORKDIR /work
