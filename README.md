# Docker Ansible Image

## Running the image without quick-ansible.sh script
```
docker run -it ismailmarmoush/ansible <any command>
docker run -it ismailmarmoush/ansible bash
# Use host machine .ssh & git folders
docker run -it -v /home/user/.ssh:/root/.ssh -v /home/user/git:/root/git ismailmarmoush/ansible bash
```


## Running the image per command (using quick-ansible.sh)
```
source quick-ansible.sh

# A container will be created then destroyed each time you run
ansible all -m ping
```

> Make sure ansible is not already installed on your host machine because the functions are called same as ansible commands.
you can just change function names in run.sh if you have ansible installed on your machine.


