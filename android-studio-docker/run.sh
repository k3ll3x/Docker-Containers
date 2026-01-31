#!/bin/bash
if [[ -z "$1" ]]
then
	echo "No data folder set"
	exit -1
fi
datafolder=$1
docker run -ti --rm -e DISPLAY=$DISPLAY --privileged --ulimit nofile=65536:65536 -v /dev/bus/usb:/dev/bus/usb -v $datafolder:/data -v /tmp/.X11-unix:/tmp/.X11-unix kelvinlawson/android-studio
