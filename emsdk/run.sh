#!/bin/bash

path=$1

if [[ -z $path ]]
then
	path=$(pwd)
fi

docker run --rm \
	-v $path:/src \
	-it debems
#	-e DISPLAY -u `id -u` \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	-v /etc/localtime:/etc/localtime:ro \
