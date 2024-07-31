#!/bin/bash

container=${CONTAINER:-docker}
exec $container exec -it login sudo -u $USER -i $*
