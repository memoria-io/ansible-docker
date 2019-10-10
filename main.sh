#!/bin/bash

run(){
    local IMAGE_NAME ssh_dir network
    local ${@}
    IMAGE_NAME=${IMAGE_NAME:-ismailmarmoush/ansible-docker}
    ssh_dir=${ssh_dir:-$HOME/.ssh}
    if [[ -n $network ]]; then
        network="--network $network"
    fi

	host_workdir=$PWD
        machine_workdir="$PWD"

	docker run -it \
        -e CODE="bash" \
	    -v $ssh_dir:/root/.ssh \
	    -v $host_workdir:$machine_workdir \
	    -w $machine_workdir \
	    $network \
	    $IMAGE_NAME
}

# Because ansible mounts folders inside docker,
# which runs as root it changes files permissions!
# sudo chown -R $(id -u $USER):$(id -g $USER) $PWD
chown_dir(){
    sudo chown -R $(id -u $USER):$(id -g $USER) $PWD
}

$@
