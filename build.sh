#!/bin/bash

container=${CONTAINER:-docker}
user=${USER:-$USER}
arch=$(uname -m)

echo "=== setup $container"
$container volume create ohpc-container-data
$container network create ohpc-container-network

set -e
echo '=== build openhpc'
$container build -t ohpc-container/openhpc:3 -f openhpc/Containerfile openhpc \
  --build-arg USER=$user \
  --build-arg ARCH=${arch/arm64/aarch64}

echo '=== build head'
$container build -t ohpc-container/head -f head/Containerfile head

echo '=== build openhpc'
$container build -t ohpc-container/node -f node/Containerfile node
