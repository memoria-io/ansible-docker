FROM debian:8.3

MAINTAINER Ismail Marmoush<marmoushismail@gmail.com>

### Install Utils
RUN apt-get update && apt-get install -y --force-yes git python python-dev python-pip
RUN pip install paramiko PyYAML Jinja2 httplib2 six

### Install Ansible
ARG ANSIBLE_DIR=/root/git/ansible

RUN mkdir -p $ANSIBLE_DIR
RUN git clone git://github.com/ansible/ansible.git --recursive $ANSIBLE_DIR

RUN mkdir -p /etc/ansible
RUN echo 'localhost' > /etc/ansible/hosts

ENV ENV_SETUP ${ANSIBLE_DIR}/hacking/env-setup"

RUN echo "source ${ENV_SETUP} -q" >> /etc/bash.bashrc

ENV CODE echo defaultBehaviour
CMD ["/bin/bash","-c","chmod +x ${ENV_SETUP} && source ${ENV_SETUP} -q && ${CODE}"]
