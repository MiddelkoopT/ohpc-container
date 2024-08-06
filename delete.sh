#!/bin/bash

container=${CONTAINER:-docker}
echo "=== delete.sh $container"

$container kill login
for I in {0..7} ; do
  $container kill node-$I
done
$container kill head

$container volume rm ohpc-container-project
$container network rm ohpc-container-network
$container image rm ohpc-container/node:latest ohpc-container/head:latest ohpc-container/openhpc:3
