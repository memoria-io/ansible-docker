#!/bin/bash

IMAGE_NAME=ismailmarmoush/ansible-docker

# Change here to fit your needs
HOST_SSH=$HOME/.ssh
HOST_GIT=$HOME/git

# Change here if you know what you're doing
MACHINE_SSH=/root/.ssh
MACHINE_GIT=/root/git

ansible(){
	CODE="$@"
	docker run -it -e CODE="ansible ${CODE}" -v $HOST_SSH:$MACHINE_SSH -v $HOST_GIT:$MACHINE_GIT $IMAGE_NAME
}

ansible_playbook(){
	CODE="$@"
	docker run -it -e CODE="ansible-playbook ${CODE}" -v $HOST_SSH:$MACHINE_SSH -v $HOST_GIT:$MACHINE_GIT  $IMAGE_NAME
}

ansible_bash(){
	docker run -it -v $HOST_SSH:$MACHINE_SSH -v $HOST_GIT:$MACHINE_GIT $IMAGE_NAME /bin/bash
}


"$@"
