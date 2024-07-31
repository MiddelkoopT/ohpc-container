#!/bin/bash

echo "=== delete.sh"

docker volume rm cluster
docker network rm cluster
docker image rm node:latest head:latest openhpc:3
