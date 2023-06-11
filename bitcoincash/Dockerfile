FROM ubuntu:20.04 as builder

ARG BLOCKCHAIN_NODE_VERSION

RUN rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y tzdata

ENV TZ=UTC

RUN apt-get update -y \
    && apt-get install -y \
        build-essential \
        cmake \
        git \
        libboost-chrono-dev \
        libboost-filesystem-dev \
        libboost-test-dev \
        libboost-thread-dev \
        libevent-dev \
        libminiupnpc-dev \
        libssl-dev \
        libzmq3-dev \
        help2man \
        ninja-build \
        python3

RUN git clone https://gitlab.com/bitcoin-cash-node/bitcoin-cash-node /workspace

WORKDIR /workspace

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN mkdir build

WORKDIR /workspace/build

RUN cmake -GNinja .. -DBUILD_BITCOIN_WALLET=OFF -DBUILD_BITCOIN_QT=OFF

RUN ninja

RUN ninja install

FROM ubuntu:20.04

RUN apt-get update -y \
    && apt-get install -y \
        libtool \
        libssl-dev \
        libevent-dev \
        libboost-dev \
        libboost-system-dev \
        libboost-filesystem-dev \
        libboost-program-options-dev \
        libboost-thread-dev \
        libminiupnpc-dev \
        libzmq3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=builder "/usr/local/bin" /usr/local/bin

ENV BITCOINCASH_DATA=/root/.bitcoin

RUN mkdir -p ${BITCOINCASH_DATA}

EXPOSE 7332 8333

CMD ["bitcoind", "-txindex"]
