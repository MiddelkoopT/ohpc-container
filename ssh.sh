#!/bin/bash

exec docker exec -it login sudo -u $USER -i $*
