#!/bin/bash

container=${CONTAINER:-docker}
CONTAINER=$container ./build.sh
network=--network=ohpc-container-network
volume=--volume=ohpc-container-project:/project

echo "=== Start cluster $container"
$container run -d --rm $network $volume --name=head --hostname=head ohpc-container/head
$container run -d --rm $network $volume --name=login --hostname=login ohpc-container/node
for I in {0..7} ; do
  $container run -d --rm $network $volume --name=node-$I --hostname=node-$I ohpc-container/node
done

echo '=== Login Node (exit to shutdown cluster)'
./ssh.sh

echo '=== Stop cluster'
for I in {0..7} ; do
  $container kill node-$I
done
$container kill login
$container kill head
