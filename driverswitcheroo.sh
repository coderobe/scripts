#!/usr/bin/env bash

# driverswitcheroo - hotswap (gpu) drivers
#
# Licensed under the Beerware license (https://en.wikipedia.org/wiki/Beerware)
# Robin Broda (coderobe) <robin@broda.me> wrote this file. As long as you retain
# this notice you can do whatever you want with this stuff. If we meet some day,
# and you think this stuff is worth it, you can buy me a beer in return.

# note: this WILL lock up your system if anything has open handles on the device
#       or drivers. When using X11, make sure to set the SeverFlags option
#       'AutoAddGPU' to off before using, to prevent X11 from automatically
#       claiming the gpu.

# Device to use
dev='0000:01:00.0'

sysfs='/sys/bus/pci/devices/'
devpath="${sysfs}${dev}"
driverpath="${sysfs}${dev}/driver"

driver="$(readlink "${driverpath}")"
driver="${driver##*/}"

driver_new="nvidia"

echo "Current driver is ${driver}, continue?"
select yn in "yes" "no"; do
  case "$yn" in
    yes ) break;;
    no ) echo "Abort."; exit 1;;
  esac
done

if [[ "${driver}" == "nvidia" ]]; then
  driver_new="nouveau"
fi

echo "Switching to ${driver_new}"

echo -n "driver_override "
echo "${driver_new}" | sudo tee "${devpath}/driver_override"

echo -n "unbind "
echo "${dev}" | sudo tee "${driverpath}/unbind"

echo -n "drivers_probe "
echo "${dev}" | sudo tee /sys/bus/pci/drivers_probe

echo "modprobe"
sudo modprobe -q "${driver_new}"

echo "lspci reports:"
sudo lspci -vs "${dev}" | grep "in use"

# DRI_PRIME=1 glxinfo | grep "OpenGL vendor string"
