FROM ubuntu:20.04
ARG COIND_VERSION
RUN rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y tzdata

ENV TZ=Asia/Tokyo

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
        python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone  https://gitlab.com/bitcoin-cash-node/bitcoin-cash-node /src

WORKDIR /src

RUN git checkout ${COIND_VERSION}

RUN mkdir build

WORKDIR /src/build

RUN cmake -GNinja .. -DBUILD_BITCOIN_WALLET=OFF -DBUILD_BITCOIN_QT=OFF

RUN ninja

ENV BITCOINCASH_DATA=/root/.bitcoin

RUN mkdir -p ${BITCOINCASH_DATA}

EXPOSE 8332 8333 18332 18333 18443 18444

CMD ["bitcoind", "-txindex"]