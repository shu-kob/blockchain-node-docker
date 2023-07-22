FROM golang:1.19 as builder

ENV BLOCKCHAIN_NODE_VERSION=master

RUN apt-get update -y \
    && apt-get install -y \
        curl \ 
        git \
        make

RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh

RUN apt-get update -y \
    && apt-get install -y \
        nodejs \
        npm \
    && apt remove cmdtest \
        yarn

RUN npm install -g pnpm

RUN git clone https://github.com/ethereum-optimism/optimism.git /workspace

WORKDIR /workspace

RUN git checkout ${BLOCKCHAIN_NODE_VERSION}

RUN apt-key adv --fetch-keys http://dl.yarnpkg.com/debian/pubkey.gpg

RUN apt-get update -y \
    && apt-get install -y \
        yarn

RUN npm install -g lerna

RUN pnpm install

RUN make op-node

RUN curl -L https://foundry.paradigm.xyz | bash

ENV PATH $PATH:/root/.foundry/bin

RUN foundryup

RUN pnpm build

FROM golang:1.19

COPY --from=builder "/workspace/op-node/bin/op-node" /usr/local/bin

ENV OP_NODE_DATA=/root/.op/op-node

RUN mkdir -p ${OP_NODE_DATA}

EXPOSE 8547 8551 30303

CMD ["op-node"]
