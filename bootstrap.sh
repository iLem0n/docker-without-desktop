#!/bin/bash

brew install \
    virtualbox \
    vagrant \
    ansible \
    docker \
    docker-compose

vagrant plugin install \
    vagrant-vbguest \
    vagrant-secret

ansible-galaxy install geerlingguy.docker

vagrant up --provision