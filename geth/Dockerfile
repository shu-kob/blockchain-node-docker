FROM ubuntu:20.04

ARG BLOCKCHAIN_NODE_VERSION
RUN rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y tzdata

ENV TZ=Asia/Tokyo

RUN apt-get update -y \
    && apt-get install -y \
        jq \
        tmux \
        git \
        wget \
        awscli \
        g++ \
        bc \
        python3 \
        make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://dl.google.com/go/go1.20.4.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz

ENV PATH=/usr/local/go/bin:$PATH

RUN git clone https://github.com/ethereum/go-ethereum /src

WORKDIR /src

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN make

ENV GETH_DATA=/root/.geth

RUN mkdir -p ${GETH_DATA}

EXPOSE 8545 30303

CMD ["src/build/bin/geth"]
