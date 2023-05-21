FROM golang:1.19

ARG BLOCKCHAIN_NODE_VERSION

RUN apt-get update -y \
    && apt-get install -y \
        git \
        wget \
        g++ \
        python3 \
        make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p $GOPATH/src/github.com/maticnetwork

WORKDIR $GOPATH/src/github.com/maticnetwork

RUN git clone https://github.com/maticnetwork/bor

WORKDIR $GOPATH/src/github.com/maticnetwork/bor

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN make bor

RUN make all

ENV GETH_DATA=/root/.polygon/bor

RUN mkdir -p ${GETH_DATA}

EXPOSE 8545 30303

CMD ["bash start.sh 1"]
