FROM golang:1.19

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
        cmake \
        libssl-dev \
        libgmp-dev \
        libtinfo5 \
        apt-transport-https \
        curl \
        gnupg \
        python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg

WORKDIR /src

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN make

ENV GETH_DATA=/root/.ethereum/geth

RUN mkdir -p ${GETH_DATA}

EXPOSE 8545 30303

CMD ["/src/build/bin/geth"]
