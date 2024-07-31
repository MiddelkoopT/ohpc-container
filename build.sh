#!/bin/bash

container=${CONTAINER:-docker}
user=${USER:-$USER}
arch=$(uname -m)

echo "=== setup $container"
$container volume create cluster
$container network create cluster

set -e
echo '=== build openhpc'
$container build -t openhpc:3 -f openhpc/Containerfile openhpc \
  --build-arg USER=$user \
  --build-arg ARCH=${arch/arm64/aarch64}

echo '=== build head'
$container build -t head -f head/Containerfile head

echo '=== build openhpc'
$container build -t node -f node/Containerfile node
