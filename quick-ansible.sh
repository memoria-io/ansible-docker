#!/bin/bash

IMAGE_NAME=ismailmarmoush/ansible-docker

# Change here to fit your needs
HOST_SSH=$HOME/.ssh
HOST_GIT=$HOME/git

# Change here if you know what you're doing
MACHINE_SSH=/root/.ssh
MACHINE_GIT=/root/git

ansible_run(){
	code="${@:2}"
	docker run -it -e CODE="$1 ${code}" -v $HOST_SSH:$MACHINE_SSH -v $HOST_GIT:$MACHINE_GIT $IMAGE_NAME
}

ansible(){
    ansible_run ansible "$@"
}

ansible_playbook(){
    ansible_run ansible-playbook "$@"
}

ansible_galaxy(){
    ansible_run ansible_galaxy "$@"
}

ansible_config(){
    ansible_run ansible_config "$@"
}

ansible_connection(){
    ansible_run ansible_connection "$@"
}

ansible_console(){
    ansible_run ansible_console "$@"
}

ansible_doc(){
    ansible_run ansible_doc "$@"
}

ansible_inventory(){
    ansible_run ansible_inventory "$@"
}

ansible_pull(){
    ansible_run ansible_pull "$@"
}

ansible_test(){
    ansible_run ansible_test "$@"
}

ansible_vault(){
    ansible_run ansible_vault "$@"
}

ansible_bash(){
    ansible_run bash "$@"
}


"$@"
