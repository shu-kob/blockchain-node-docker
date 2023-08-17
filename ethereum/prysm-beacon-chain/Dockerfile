FROM gcr.io/bazel-public/bazel:6.3.2

ARG BLOCKCHAIN_NODE_VERSION

RUN git clone https://github.com/prysmaticlabs/prysm.git

WORKDIR prysm

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN bazel build //cmd/beacon-chain:beacon-chain --config=release

ENV DATA_DIR=/root/.eth2

RUN mkdir -p ${DATA_DIR}

EXPOSE 8551 30303

CMD ["bazel run //beacon-chain --config=release"]
