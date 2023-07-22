FROM golang:1.19 as builder

ARG BLOCKCHAIN_NODE_VERSION

RUN apt-get update -y \
    && apt-get install -y \
        git \
        g++ \
        bc \
        python3 \
        make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/Fantom-foundation/go-opera.git /workspace

WORKDIR /workspace

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN make

FROM golang:1.19

COPY --from=builder "/workspace/build/opera" /usr/local/bin

ENV BLOCKCHAIN_NODE_DATA=/root/.fantom

RUN mkdir -p ${BLOCKCHAIN_NODE_DATA}

EXPOSE 5050 8080

CMD ["opera"]
