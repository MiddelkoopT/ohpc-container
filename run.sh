#!/bin/bash

./build.sh

echo '=== Start cluster'
docker run -d --rm --network cluster --volume cluster:/data --name head --hostname head head
docker run -d --rm --network cluster --volume cluster:/data --name login --hostname login node
for I in {0..7} ; do
  docker run -d --rm --network cluster --volume cluster:/data --name node-$I --hostname node-$I node
done

echo '=== Login Node (exit to shutdown cluster)'
./ssh.sh

echo '=== Stop cluster'
docker kill login
for I in {0..7} ; do
  docker kill node-$I
done
docker kill head
