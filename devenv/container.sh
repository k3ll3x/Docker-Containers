#!/bin/bash

contname="devenv"
username="devu"
userhome="/home/${username}"

usage(){
	printf "$0 run\n$0 build\n$0 build-nocache\n\n"
}

if [[ $# -eq 0 ]]
then
	usage
	exit
fi

#-v $HOME/.ssh:/root/.ssh \

if [[ "$1" == "run" ]]
then
	xhost +
	docker run -it \
		-v $(pwd)/src:${userhome}/src \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v $HOME/.ssh:${userhome}/.ssh \
		-e DISPLAY=:0 \
		--device /dev/snd \
		--net=host \
		$contname \
		"fish"
elif [[ "$1" == "build" ]]
then
	docker build -t $contname --build-arg username=$username --build-arg userhome=$userhome .
elif [[ "$1" == "build-nocache" ]]
then
	docker build -t $contname --build-arg username=$username --build-arg userhome=$userhome --no-cache .
else
	usage
fi
