FROM golang:1.19 as builder

ARG BLOCKCHAIN_NODE_VERSION

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

RUN git clone https://github.com/ethereum/go-ethereum /workspace

WORKDIR /workspace

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN make

FROM golang:1.19

COPY --from=builder "/workspace/build/bin/geth" /usr/local/bin

ENV GETH_DATA=/root/.ethereum/geth

RUN mkdir -p ${GETH_DATA}

EXPOSE 8545 8551 30303

CMD ["geth"]
