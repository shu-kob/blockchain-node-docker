#!/bin/bash

if [ $# -gt 0 ]; then VERSION=$1; shift; fi
if [ $# -gt 0 ]; then echo "syntax: $0 [<VERSION>]"; exit 1; fi

IMAGE_NAME="polkadot"
echo $IMAGE_NAME
docker build -t $IMAGE_NAME:${VERSION} -t $IMAGE_NAME:latest --build-arg VERSION=$VERSION .
