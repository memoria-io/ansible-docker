# Docker Ansible Image

[![Docker Build Status](https://img.shields.io/docker/build/ismailmarmoush/ansible-docker.svg)](https://hub.docker.com/r/ismailmarmoush/ansible-docker/)
[![Docker Build Status](https://img.shields.io/docker/pulls/ismailmarmoush/ansible-docker.svg)](https://hub.docker.com/r/ismailmarmoush/ansible-docker/)

### Running the image without quick-ansible.sh script
```
docker run -it ismailmarmoush/ansible-docker <any command>
docker run -it ismailmarmoush/ansible-docker bash
```

### Mounting .ssh & Git folder
```
docker run -it -v /home/user/.ssh:/root/.ssh -v /home/user/git:/root/git ismailmarmoush/ansible-docker bash
```


## Running the image per command (using quick-ansible.sh)
A container will be created then destroyed each time you run 
`ansible ... ` or `ansible-playbook ...`
```
source quick-ansible.sh
ansible all -m ping
```

Make sure ansible is not already installed on your host machine because the functions 
are called same as ansible commands. 

You can just change function names in run.sh if you have ansible installed on your machine.


