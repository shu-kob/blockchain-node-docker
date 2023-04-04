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
        git \
        curl \
        libfmt-dev \
        libgmp3-dev \
        bison \
        python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/qtumproject/qtum /src

WORKDIR /src

RUN git checkout ${COIND_VERSION}

RUN make -j2 -C depends/

RUN ./autogen.sh

RUN ./configure --disable-wallet --disable-tests --disable-bench --without-gui --prefix="/src/depends/x86_64-pc-linux-gnu"

RUN V=1 make clean

RUN V=1 make -j2

RUN make install

ENV QTUM_DATA=/root/.qtum

RUN mkdir -p ${QTUM_DATA}

EXPOSE 3888 3889

CMD ["qtumd", "-txindex"]