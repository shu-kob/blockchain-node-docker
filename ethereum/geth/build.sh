#!/bin/bash

if [ $# -gt 0 ]; then BLOCKCHAIN_NODE_VERSION=$1; shift; fi
if [ $# -gt 0 ]; then echo "syntax: $0 [<VERSION>]"; exit 1; fi

IMAGE_NAME="geth"
echo $IMAGE_NAME
docker build -t $IMAGE_NAME:${BLOCKCHAIN_NODE_VERSION} -t $IMAGE_NAME:latest --build-arg BLOCKCHAIN_NODE_VERSION=$BLOCKCHAIN_NODE_VERSION .
