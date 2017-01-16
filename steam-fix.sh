#!/usr/bin/env bash

# A script to fix steam library errors by brute force
#
# Licensed under the Beerware license (https://en.wikipedia.org/wiki/Beerware)
# coderobe <robin@broda.me> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.

find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete
find ~/.local/share/Steam/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete
find ~/.local/share/Steam/ \( -name "libgpg-error.*"  \) -print -delete
