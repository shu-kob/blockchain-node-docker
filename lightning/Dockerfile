FROM ubuntu:20.04

ARG BLOCKCHAIN_NODE_VERSION

RUN rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y tzdata

ENV TZ=UTC

RUN apt-get update \
    && apt-get install -y \
      autoconf automake build-essential git libtool libgmp-dev libsqlite3-dev \
      python3 python3-pip net-tools zlib1g-dev libsodium-dev gettext \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip3 install --upgrade pip
RUN pip3 install --user poetry

RUN git clone https://github.com/ElementsProject/lightning.git /src

WORKDIR /src

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN pip3 install --upgrade pip
RUN pip3 install mako
RUN ./configure
RUN make
RUN make install

ENV LIGHTNING_DATA=/root/.lightning

RUN mkdir -p ${LIGHTNING_DATA}

EXPOSE 9735

CMD ["lightningd"]