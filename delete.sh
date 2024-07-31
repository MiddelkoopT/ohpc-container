#!/bin/bash

container=${CONTAINER:-docker}
echo "=== delete.sh $container"

$container volume rm cluster
$container network rm cluster
$container image rm node:latest head:latest openhpc:3
