#!/bin/bash

if [ $# -gt 0 ]; then BLOCKCHAIN_NODE_VERSION=$1; shift; fi
if [ $# -gt 0 ]; then echo "syntax: $0 [<VERSION>]"; exit 1; fi

IMAGE_NAME="geth"
echo $IMAGE_NAME
docker build -t $IMAGE_NAME:${BLOCKCHAIN_NODE_VERSION} --build-arg VERSION=$BLOCKCHAIN_NODE_VERSION .
