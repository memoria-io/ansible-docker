# Docker Ansible Image

## Running the image without run.sh script
> The following code doesn't use run.sh,
It uses host machine ssh and git folders, then it goes into bash
```
docker run -it -v /home/user/.ssh:/root/.ssh -v /home/user/git:/root/git ismailmarmoush/ansible bash
```

## One image run per command (using run.sh)
> With one command the Docker image will be run and it will execute your ansible command, then it will close. 
Also make sure ansible is not already installed on your host machine because the function is called ansible too, 
you can just change function names in run.sh file to fit your needs.

```
source run.sh
```

Now you can use ansible as if it was installed on your host machine.
```
ansible all -m ping
```


