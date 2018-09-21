#!/bin/bash

IMAGE_NAME=ismailmarmoush/ansible-docker

HOST_SSH=$HOME/.ssh
MACHINE_SSH=/root/.ssh

run_ansible(){
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
    run_ansible ansible "$@"
}

ansible-playbook(){
    run_ansible ansible-playbook "$@"
}

ansible-galaxy(){
    run_ansible ansible-galaxy "$@"
}

ansible-config(){
    run_ansible ansible-config "$@"
}

ansible-connection(){
    run_ansible ansible-connection "$@"
}

ansible-console(){
    run_ansible ansible-console "$@"
}

ansible-doc(){
    run_ansible ansible-doc "$@"
}

ansible-inventory(){
    run_ansible ansible-inventory "$@"
}

ansible-pull(){
    run_ansible ansible-pull "$@"
}

ansible-test(){
    run_ansible ansible-test "$@"
}

ansible-vault(){
    run_ansible ansible-vault "$@"
}

ansible_bash(){
    run_ansible bash "$@"
}


"$@"
