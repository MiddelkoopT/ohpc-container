#!/bin/bash

container=${CONTAINER:-docker}
user=${USER:-$USER}
uid=${UID:-$UID}
arch=$(uname -m)

echo "=== setup $container"
$container volume create ohpc-container-project
$container network create ohpc-container-network

set -e
echo '=== build openhpc'
$container build -t ohpc-container/openhpc:3 -f openhpc/Containerfile openhpc \
  --build-arg USER=$user \
  --build-arg UID=$uid \
  --build-arg ARCH=${arch/arm64/aarch64}

for I in head node ; do
  echo "=== build $I"
  $container build -t ohpc-container/$I -f $I/Containerfile $I
done
