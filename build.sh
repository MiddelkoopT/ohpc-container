#!/bin/bash

user=${USER:-$USER}
arch=$(uname -m)

echo '=== docker setup'
docker volume create cluster
docker network create cluster

set -e
echo '=== build openhpc'
docker build -t openhpc:3 openhpc \
  --build-arg USER=$user \
  --build-arg ARCH=${arch/arm64/aarch64}

echo '=== build head'
docker build -t head head

echo '=== build openhpc'
docker build -t node node
