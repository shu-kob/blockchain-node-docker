FROM debian:stretch-slim as builder
ARG COIND_VERSION

RUN apt-get update -y \
    && apt-get install -y \
        build-essential \
        libtool \
        autotools-dev \
        automake \
        pkg-config \
        libssl-dev \
        libevent-dev \
        bsdmainutils \
        libboost-dev \
        libboost-system-dev \
        libboost-filesystem-dev \
        libboost-program-options-dev \
        libboost-thread-dev \
        autotools-dev \
        bsdmainutils \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/bitcoin/bitcoin.git --branch ${COIND_VERSION} /src

WORKDIR /src

RUN ./autogen.sh

RUN ./configure --disable-wallet --disable-tests --disable-bench --without-gui

RUN V=1 make clean

RUN V=1 make -j2

RUN make install

ENV BITCOIN_DATA=/root/.dogecoin

RUN mkdir -p ${BITCOIN_DATA}

EXPOSE 8332 8333 18332 18333 18443 18444 38332 38333

CMD ["bitcoind", "-txindex"]