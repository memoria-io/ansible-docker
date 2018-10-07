#!/bin/bash

ansible_run(){
    IMAGE_NAME=ismailmarmoush/ansible-docker
    network=$1
    host_ssh=$2
    host_ssh=${host_ssh:-$HOME/.ssh}
	host_workdir=$PWD
    machine_workdir="$PWD"

	docker run -it \
        -e CODE="bash" \
	    -v $host_ssh:/root/.ssh \
	    -v $host_workdir:$machine_workdir \
	    -w $machine_workdir \
	    --network $network \
	    $IMAGE_NAME
}

# Because ansible mounts folders inside docker,
# which runs as root it changes files permissions!
# sudo chown -R $(id -u $USER):$(id -g $USER) $PWD
chown_dir(){
    sudo chown -R $(id -u $USER):$(id -g $USER) $PWD
}

$@