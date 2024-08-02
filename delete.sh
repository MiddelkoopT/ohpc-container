#!/bin/bash

container=${CONTAINER:-docker}
echo "=== delete.sh $container"

$container volume rm ohpc-container-data
$container network rm ohpc-container-network
$container image rm ohpc-container/node:latest ohpc-container/head:latest ohpc-container/openhpc:3
