#!/bin/bash

IMAGE_NAME=ismailmarmoush/ansible-docker

# Change here to fit your needs
HOST_SSH=$HOME/.ssh
host_workdir=.

# Change here if you know what you're doing
MACHINE_SSH=/root/.ssh
machine_workdir=/root/git

ansible_run(){
	code="${@:2}"
	docker run -it \
	    -e CODE="$1 ${code}" \
	    -v $HOST_SSH:$MACHINE_SSH \
	    -v $host_workdir:$machine_workdir \
	    -w $machine_workdir \
	    $IMAGE_NAME
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
