#!/bin/bash

if [ $# -gt 0 ]; then VERSION=$1; shift; fi
if [ $# -gt 0 ]; then echo "syntax: $0 [<VERSION>]"; exit 1; fi

IMAGE_NAME="polkadot-${VERSION}"
echo $IMAGE_NAME
docker build -t $IMAGE_NAME --build-arg VERSION=$VERSION .
