# Docker Ansible Image

[![Docker Build Status](https://img.shields.io/docker/build/ismailmarmoush/ansible-docker.svg)](https://hub.docker.com/r/ismailmarmoush/ansible-docker/)
[![Docker Build Status](https://img.shields.io/docker/pulls/ismailmarmoush/ansible-docker.svg)](https://hub.docker.com/r/ismailmarmoush/ansible-docker/)

## Run without any helper scripts
```
docker run -it ismailmarmoush/ansible-docker bash
docker run -it ismailmarmoush/ansible-docker <any other command>
```

## Run with helper script
```bash
./main.sh run <private network name> <your ssh key directory> 
```

## Note
> quick-ansible.sh was removed for simplicity reasons
