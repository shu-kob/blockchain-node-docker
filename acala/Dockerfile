FROM rust:1.69.0 as builder

ARG BLOCKCHAIN_NODE_VERSION

RUN apt-get update -y \
    && apt-get install -y \
        bc \
        gcc \
        build-essential \
        clang \
        libclang-dev \
        pkg-config \
        libssl-dev \
        cmake \
        protobuf-compiler \
        git \
        curl

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
    sh -s -- -y --default-toolchain nightly --no-modify-path

RUN git clone https://github.com/AcalaNetwork/Acala.git /workspace

WORKDIR /workspace

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

WORKDIR /workspace/scripts

RUN ./init.sh

WORKDIR /workspace

RUN cargo build --release --features with-acala-runtime

FROM rust:1.69.0

COPY --from=builder "/workspace/target/release/acala" /usr/local/bin

EXPOSE 9933 9944

CMD ["acala"]
