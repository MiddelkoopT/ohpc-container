#!/bin/bash

container=${CONTAINER:-docker}
CONTAINER=$container ./build.sh

echo "=== Start cluster $container"
$container run -d --rm --network ohpc-container-network --volume ohpc-container-data:/data --name head --hostname head ohpc-container/head
$container run -d --rm --network ohpc-container-network --volume ohpc-container-data:/data --name login --hostname login ohpc-container/node
for I in {0..7} ; do
  $container run -d --rm --network ohpc-container-network --volume cluster:/data --name node-$I --hostname node-$I ohpc-container/node
done

echo '=== Login Node (exit to shutdown cluster)'
./ssh.sh

echo '=== Stop cluster'
$container kill login
for I in {0..7} ; do
  $container kill node-$I
done
$container kill head
