FROM golang:1.19 as builder

ARG BLOCKCHAIN_NODE_VERSION

RUN apt-get update -y \
    && apt-get install -y \
        git \
        make

RUN git clone https://github.com/ethereum-optimism/op-geth.git /workspace

WORKDIR /workspace

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN make geth

FROM golang:1.19

COPY --from=builder "/workspace/build/bin/geth" /usr/local/bin

ENV OP_GETH_DATA=/root/.op/op-geth

RUN mkdir -p ${OP_GETH_DATA}

EXPOSE 8545 8551 30303

CMD ["geth"]
