#!/usr/bin/env bash

# A script to show total memory wasted on tmpfs mounts in MiB
#
# Licensed under the Beerware license (https://en.wikipedia.org/wiki/Beerware)
# coderobe <robin@broda.me> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.

echo $(expr $(T_USAGE=0; for usage in $(df -Tt tmpfs | sed 's/  */ /g' | cut -d' ' -f4 | tail -n+2 | tr '\n' ' '); do T_USAGE=$(expr $T_USAGE + $usage); done; echo $T_USAGE) / 1024)M
