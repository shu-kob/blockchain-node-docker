FROM ubuntu:20.04
ARG VERSION
RUN rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y tzdata

ENV TZ=Asia/Tokyo 

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
        curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV RUST_HOME /usr/local/lib/rust
ENV RUSTUP_HOME ${RUST_HOME}/rustup
ENV CARGO_HOME ${RUST_HOME}/cargo
RUN mkdir /usr/local/lib/rust && \
    chmod 0755 $RUST_HOME
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ${RUST_HOME}/rustup.sh \
    && chmod +x ${RUST_HOME}/rustup.sh \
    && ${RUST_HOME}/rustup.sh -y --default-toolchain nightly --no-modify-path
ENV PATH $PATH:$CARGO_HOME/bin

RUN curl https://getsubstrate.io -sSf | bash -s -- --fast

RUN git clone https://github.com/AstarNetwork/Astar /src

WORKDIR /src

RUN git checkout ${VERSION}

RUN cargo build --release

EXPOSE 9933 9944

CMD ["/src/target/release/astar-collator"]
