FROM ubuntu:20.04

ARG BLOCKCHAIN_NODE_VERSION

RUN rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y tzdata

ENV TZ=Asia/Tokyo

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
        git \
        wget \
        g++ \
        unzip \
        zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/bin

RUN wget https://github.com/bazelbuild/bazel/releases/download/5.4.0/bazel-5.4.0-installer-linux-x86_64.sh

RUN chmod +x bazel-5.4.0-installer-linux-x86_64.sh

RUN ./bazel-5.4.0-installer-linux-x86_64.sh --user

ENV PATH="$PATH:$HOME/bin"

RUN ln -s bazel-5.4.0 bazel

RUN git clone https://github.com/prysmaticlabs/prysm /src

WORKDIR /src

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN bazel build //beacon-chain:beacon-chain --config=release

ENV PRYSM_BEACON_DATA=/root/.ethereum/prysm

RUN mkdir -p ${PRYSM_BEACON_DATA}

EXPOSE 8551 30303

CMD ["bazel run //beacon-chain --config=release"]
