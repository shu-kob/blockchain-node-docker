#!/bin/bash

if [ $# -gt 0 ]; then COIND_VERSION=$1; shift; fi
if [ $# -gt 0 ]; then echo "syntax: $0 [<COIND_VERSION>]"; exit 1; fi

IMAGE_NAME="monacoin:${COIND_VERSION}"
echo $IMAGE_NAME
docker build -t $IMAGE_NAME --build-arg COIND_VERSION=$COIND_VERSION .
