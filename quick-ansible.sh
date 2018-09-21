#!/bin/bash

IMAGE_NAME=ismailmarmoush/ansible-docker

HOST_SSH=$HOME/.ssh
MACHINE_SSH=/root/.ssh

ansible_run(){
	code="${@:2}"
	host_workdir=$PWD
    machine_workdir="$PWD"

	docker run -it \
	    -e CODE="$1 ${code}" \
	    -v $HOST_SSH:$MACHINE_SSH \
	    -v $host_workdir:$machine_workdir \
	    -w $machine_workdir \
	    $IMAGE_NAME

    # Because ansible mounts folders inside docker,
    # which runs as root it changes files permissions!
    # sudo chown -R $(id -u $USER):$(id -g $USER) $PWD
}

chown_dir(){
    sudo chown -R $(id -u $USER):$(id -g $USER) $PWD
}

ansible(){
    ansible_run ansible "$@"
}

ansible_playbook(){
    ansible_run ansible-playbook "$@"
}

ansible_galaxy(){
    ansible_run ansible-galaxy "$@"
}

ansible_config(){
    ansible_run ansible-config "$@"
}

ansible_connection(){
    ansible_run ansible-connection "$@"
}

ansible_console(){
    ansible_run ansible-console "$@"
}

ansible_doc(){
    ansible_run ansible-doc "$@"
}

ansible_inventory(){
    ansible_run ansible-inventory "$@"
}

ansible_pull(){
    ansible_run ansible-pull "$@"
}

ansible_test(){
    ansible_run ansible-test "$@"
}

ansible_vault(){
    ansible_run ansible-vault "$@"
}

ansible_bash(){
    ansible_run bash "$@"
}


"$@"
