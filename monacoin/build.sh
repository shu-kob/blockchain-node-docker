#!/bin/bash

if [ $# -gt 0 ]; then BLOCKCHAIN_NODE_VERSION=$1; shift; fi
if [ $# -gt 0 ]; then echo "syntax: $0 [<BLOCKCHAIN_NODE_VERSION>]"; exit 1; fi

IMAGE_NAME="monacoin"
echo $IMAGE_NAME
docker build -t $IMAGE_NAME:${BLOCKCHAIN_NODE_VERSION} --build-arg BLOCKCHAIN_NODE_VERSION=$BLOCKCHAIN_NODE_VERSION .
