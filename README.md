# Docker Ansible Image

[![Docker Build Status](https://img.shields.io/docker/build/ismailmarmoush/ansible-docker.svg)](https://hub.docker.com/r/ismailmarmoush/ansible-docker/)
[![Docker Build Status](https://img.shields.io/docker/pulls/ismailmarmoush/ansible-docker.svg)](https://hub.docker.com/r/ismailmarmoush/ansible-docker/)

## Normal run
```
docker run -it ismailmarmoush/ansible-docker <any command>
docker run -it ismailmarmoush/ansible-docker bash
```

## Quick run
By sourcing `source quick-ansible.sh` or  adding it to .bashrc  `source ~/git/ansible-docker/quick-ansible.sh`
 
1. A container will be created then destroyed each time you run.
2. You'll be able to run ansible commands directly
3. script will automatically mount your current directory
4. script will mount your .ssh in the docker

**Examples:**

```bash
ansible --version
# Hence, normal ansible commands are hyphened, while here are underscored 
ansible_galaxy
ansible_vault
...
```

> Make sure ansible is not already installed on your host machine because the functions 
are called same as ansible commands. 



