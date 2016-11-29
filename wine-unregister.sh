#!/usr/bin/env bash

# This script was only tested on Archlinux!
# A script to unregister existing wine file associations
#
# Licensed under the Beerware license (https://en.wikipedia.org/wiki/Beerware)
# coderobe <robin@broda.me> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.

echo "Unregistering WINE file associations"
rm -f ~/.local/share/applications/wine-extension*.desktop
rm -f ~/.local/share/icons/hicolor/*/*/application-x-wine-extension*
rm -f ~/.local/share/applications/mimeinfo.cache
rm -f ~/.local/share/mime/packages/x-wine*
rm -f ~/.local/share/mime/application/x-wine-extension*
update-desktop-database ~/.local/share/applications
update-mime-database ~/.local/share/mime/
echo "Done"
