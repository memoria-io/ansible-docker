#!/bin/bash

IMAGE_NAME=ismailmarmoush/ansible-docker
network="private_network"
host_ssh=$HOME/.ssh
machine_ssh=/root/.ssh

ansible_run(){
	code="${@:2}"
	host_workdir=$PWD
    machine_workdir="$PWD"

	docker run -it \
	    -e CODE="$1 ${code}" \
	    -v $host_ssh:$machine_ssh \
	    -v $host_workdir:$machine_workdir \
	    -w $machine_workdir \
	    --network $network \
	    $IMAGE_NAME

    # Because ansible mounts folders inside docker,
    # which runs as root it changes files permissions!
    # sudo chown -R $(id -u $USER):$(id -g $USER) $PWD
}

ansible-bash(){
    ansible_run bash "$@"
}

ansible(){
    ansible_run ansible "$@"
}

ansible-playbook(){
    ansible_run ansible-playbook "$@"
}

ansible-galaxy(){
    ansible_run ansible-galaxy "$@"
}

ansible-config(){
    ansible_run ansible-config "$@"
}

ansible-connection(){
    ansible_run ansible-connection "$@"
}

ansible-console(){
    ansible_run ansible-console "$@"
}

ansible-doc(){
    ansible_run ansible-doc "$@"
}

ansible-inventory(){
    ansible_run ansible-inventory "$@"
}

ansible-pull(){
    ansible_run ansible-pull "$@"
}

ansible-test(){
    ansible_run ansible-test "$@"
}

ansible-vault(){
    ansible_run ansible-vault "$@"
}

#######################################################################
# Utils
#######################################################################

chown_dir(){
    sudo chown -R $(id -u $USER):$(id -g $USER) $PWD
}

"$@"
