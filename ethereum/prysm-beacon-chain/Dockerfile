FROM gcr.io/bazel-public/bazel:6.3.2

ARG BLOCKCHAIN_NODE_VERSION

RUN git clone https://github.com/prysmaticlabs/prysm.git

WORKDIR prysm

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN bazel build //cmd/beacon-chain:beacon-chain --config=release

ENV PRYSM_BEACON_DATA=/root/.eth2

RUN mkdir -p ${PRYSM_BEACON_DATA}

EXPOSE 8551 30303

CMD ["bazel run //beacon-chain --config=release"]
