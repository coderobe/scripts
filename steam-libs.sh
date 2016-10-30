#!/usr/bin/env bash

# This script only supports Archlinux!
# A script to list missing dependencies for a native steam environment
# Depends on coreutils and pkgfile
#
# Licensed under the Beerware license (https://en.wikipedia.org/wiki/Beerware)
# coderobe <robin@broda.me> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.

((pacman -Q $((set -e&& for lib in $(find ~/.steam/steam/ -type f -name '*.so' -exec ldd {} \; | grep "not found" | sort -u | cut -d$'\t' -f2- | cut -d" " -f1); do pkgfile "$lib"; done) | sort -u | cut -d"/" -f2- | tr "\n" " ") 2>&1 | egrep "^error:" | cut -d"'" -f2) | tr "\n" " ") || echo -e "\nPlease install these packages and try again" && echo "You're all set!"
