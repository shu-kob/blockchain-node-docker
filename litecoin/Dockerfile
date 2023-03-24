FROM ubuntu:20.04
ARG COIND_VERSION
RUN rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y tzdata

ENV TZ=Asia/Tokyo

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
        libfmt-dev \
        libdb5.3++-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/litecoin-project/litecoin --branch ${COIND_VERSION} /src

WORKDIR /src

RUN ./autogen.sh

RUN ./configure --disable-wallet --disable-tests --disable-bench --without-gui

RUN V=1 make clean

RUN V=1 make -j2

RUN make install

ENV LITECOIN_DATA=/root/.litecoin

RUN mkdir -p ${LITECOIN_DATA}

EXPOSE 9332 9333 19332 19335 19443 19444

CMD ["litecoind", "-txindex"]