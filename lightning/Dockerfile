FROM ubuntu:20.04

ARG BLOCKCHAIN_NODE_VERSION

RUN apt-get update -y && apt install -y wget xz-utils
RUN wget https://github.com/ElementsProject/lightning/releases/download/${BLOCKCHAIN_NODE_VERSION}/clightning-${BLOCKCHAIN_NODE_VERSION}-Ubuntu-20.04.tar.xz
RUN tar -xvf clightning-${BLOCKCHAIN_NODE_VERSION}-Ubuntu-20.04.tar.xz
RUN chmod +x /usr/bin/lightning*

ENV LIGHTNING_DATA=/root/.lightning

RUN mkdir -p ${LIGHTNING_DATA}

EXPOSE 9735

CMD ["lightningd"]